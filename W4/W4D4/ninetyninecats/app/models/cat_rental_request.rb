class CatRentalRequest < ActiveRecord::Base
  before_validation :set_status

  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }

  belongs_to :cat

  def approve!
    raise "An overlapping APPROVED request exists." unless overlapping_approved_requests.empty?
    self.class.transaction do
      update(status: "APPROVED")
      overlapping_pending_requests.each do |request|
        request.update(status: "DENIED")
      end
    end
  end

  def deny!
    update(status: "DENIED")
  end

  def overlapping_requests
    sql_params = {
      cat_id: cat_id,
      start_date: start_date,
      end_date: end_date,
      id: id
    }
    CatRentalRequest.select("*").where(<<-SQL, sql_params)
      id != :id
    AND
      cat_id = :cat_id
    AND
      (start_date BETWEEN :start_date AND :end_date
      OR
      end_date BETWEEN :start_date AND :end_date)
    SQL
  end

  def overlapping_pending_requests
    sql_params = {
      cat_id: cat_id,
      start_date: start_date,
      end_date: end_date,
      id: id,
      status: "PENDING"
    }
    CatRentalRequest.select("*").where(<<-SQL, sql_params)
      id != :id
    AND
      cat_id = :cat_id
    AND
      status = :status
    AND
      (start_date BETWEEN :start_date AND :end_date
      OR
      end_date BETWEEN :start_date AND :end_date)
    SQL
  end

  def overlapping_approved_requests
    sql_params = {
      cat_id: cat_id,
      start_date: start_date,
      end_date: end_date,
      id: id,
      status: "APPROVED"
    }
    CatRentalRequest.select("*").where(<<-SQL, sql_params)
      id != :id
    AND
      cat_id = :cat_id
    AND
      status = :status
    AND
      (start_date BETWEEN :start_date AND :end_date
      OR
      end_date BETWEEN :start_date AND :end_date)
    SQL
  end

  private

    def set_status
      self.status ||= "PENDING"
    end

end
