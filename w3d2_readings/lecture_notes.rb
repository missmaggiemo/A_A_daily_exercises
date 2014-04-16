require 'sqlite3'
require 'singleton'

class CompanyDB < SQLite3::Database
  include Singleton
  
  def initialize
    super("stock.db")
    
    self.results_as_hash = true
    self.type_translation = true
  end
end

class Company
  
  def self.all
    
  end
  
  attr_accessor :name, :ticker, :id
  
  def initialize(options={})
    @name = options["name"]
    @ticker = options["ticker"]
    @id = options["id"]
  end
end

class Price
  
  def self.all
    
  end
  
  attr_accessor :price, :date, :id, :company_id
  
  def initialize(options={})
    @price = options["price"]
    @date = options["date"]
    @id = options["id"]
    @company_id = options["company_id"]
  end
  
  def company
    company_data = CompanyDB.instance.get_first_row(<<-SQL, company_id: => company_id)
      SELECT
      *
      FROM
      companies
      WHERE
      id = :company_id
    SQL
    Company.new(company_data)
  end
  # can use ? or #{@ivar}
  
end