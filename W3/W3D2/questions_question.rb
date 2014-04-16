require_relative 'questions_database'

class Question < QuestionClass

  def self.find_by_author_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE user_id=?", id)
    data.each_with_object([]) do |question_data, questions|
      questions << Question.new(question_data)
    end
  end

  def self.most_followed(n)
    QuestionFollower.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  attr_accessor :id, :title, :body, :user_id

  def initialize(option = {})
    @id = option['id']
    @title = option['title']
    @body = option['body']
    @user_id = option['user_id']
  end

  def author
    User.find_by_id(self.user_id)
  end

  def replies
    Reply.find_by_question_id(self.id)
  end

  def followers
    QuestionFollower.followers_for_question_id(self.id)
  end

  def likers
    QuestionLike.likers_for_question_id(self.id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(self.id)
  end

end