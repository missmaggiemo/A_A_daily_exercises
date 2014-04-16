require_relative 'questions_database'

class Reply < QuestionClass

  attr_accessor :id, :question_id, :reply_id, :user_id, :body

  def self.find_by_question_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE question_id=?", id)
    replies = []
    data.each do |reply_data|
      replies << Reply.new(reply_data)
    end
    replies
  end

  def self.find_by_user_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE user_id=?", id)
    replies = []
    data.each do |reply_data|
      replies << Reply.new(reply_data)
    end
    replies
  end

  def initialize(option={})
     @id = option['id']
     @question_id = option['question_id']
     @reply_id = option['reply_id']
     @user_id = option['user_id']
     @body = option['body']
  end

  def author
    User.find_by_id(self.user_id)
  end

  def question
    Question.find_by_id(self.question_id)
  end

  def parent_reply
    return nil if reply_id.nil?
    Reply.find_by_id(self.reply_id)
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT
        *
      FROM
        replies
      WHERE
        reply_id=?
    SQL
    replies = []
    data.each do |reply_data|
      replies << Reply.new(reply_data)
    end
    replies
  end

end