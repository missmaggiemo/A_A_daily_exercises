require_relative 'questions_database'

class QuestionFollower < QuestionClass
  attr_accessor :id, :user_id, :question_id

  def self.followers_for_question_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        users.id, fname, lname
      FROM
        question_followers
      JOIN
        users
      ON
        users.id = user_id
      WHERE
        question_id = ?
    SQL
    users = []
    data.each do |user_data|
      users << User.new(user_data)
    end
    users
  end

  def self.followed_questions_for_user_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        q.*
      FROM
        question_followers qf
      JOIN
        questions q
      ON
        q.id=qf.question_id
      WHERE
        qf.user_id=?
    SQL
    questions = []
    data.each do |question_data|
      questions << Question.new(question_data)
    end
    questions
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        q.*
      FROM
        question_followers qf
      JOIN
        questions q
      ON
        q.id=qf.user_id
      GROUP BY
        q.id
      ORDER BY
        COUNT(qf.user_id)
      DESC
    SQL
    questions = []
    data[0...n].each do |question_data|
      questions << Question.new(question_data)
    end
    questions
  end

  def initialize(option = {})
     @id = option['id']
     @user_id = option['user_id']
     @question_id = option['question_id']
  end

end