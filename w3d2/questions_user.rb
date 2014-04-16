require_relative 'questions_database'

class User < QuestionClass

  attr_accessor :id, :fname, :lname

  def self.find_by_name(fname, lname)
    # use heredoc
    data = QuestionsDatabase.instance.get_first_row("SELECT * FROM users WHERE fname = ? AND lname = ?", fname, lname)
    User.new(data)
  end

  def initialize(option={})
    @id = option['id']
    @fname = option['fname']
    @lname = option['lname']
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end

  def followed_questions
    QuestionFollower.followed_questions_for_user_id(self.id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(self.id)
  end

  def average_karma
    QuestionsDatabase.instance.get_first_value(<<-SQL, self.id)
      SELECT
        AVG(count)
      FROM
        (SELECT
          COUNT(ql.user_id) count
        FROM
          questions q
        JOIN
          question_likes ql
        ON
          q.id = ql.question_id
        WHERE
          q.user_id = ?
        GROUP BY
          q.id) num_likes
    SQL
  end

end