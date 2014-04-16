require_relative 'questions_database'

class QuestionLike < QuestionClass

  attr_accessor :id, :user_id, :question_id

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.id, fname, lname
      FROM
        question_likes
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

  def self.num_likes_for_question_id(question_id)
    QuestionsDatabase.instance.get_first_value(<<-SQL, question_id)
      SELECT
        COUNT(qlikes.user_id)
      FROM
        question_likes qlikes
      JOIN
        questions q
      ON
        q.id=qlikes.question_id
      WHERE
        q.id=?
      GROUP BY
        q.id
    SQL
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        q.id, title, body, qlikes.user_id
      FROM
        question_likes qlikes
      JOIN
        questions q
      ON
        q.id = qlikes.question_id
      WHERE
        qlikes.user_id = ?
    SQL
    questions = []
    data.each do |question_data|
      questions << Question.new(question_data)
    end
    questions
  end

  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        q.*
      FROM
        question_likes ql
      JOIN
        questions q
      ON
        q.id=ql.question_id
      GROUP BY
        q.id
      ORDER BY
        COUNT(ql.user_id)
      DESC
    SQL
    questions = []
    data[0...n].each do |question_data|
      questions << Question.new(question_data)
    end
    questions
  end

  def initialize(option={})
     @id = option['id']
     @user_id = option['user_id']
     @question_id = option['question_id']
  end

end