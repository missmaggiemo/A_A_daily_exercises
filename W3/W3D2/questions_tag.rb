require_relative 'questions_database'

class Tag < QuestionClass

  attr_accessor :id, :tag

  def self.find_by_question_id(id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_tags WHERE question_id=?", id)
    tags = []
    data.each do |tag_data|
      tags << Tag.find_by_id(tag_data['tag_id'])
    end
    tags
  end

  def self.most_popular(n)
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        t.*
      FROM
        question_tags qt
      JOIN
        question_likes ql
      ON
        qt.question_id=ql.question_id
      JOIN
        tags t
      ON
        t.id = qt.tag_id
      GROUP BY
        qt.tag_id
      ORDER BY
        COUNT(ql.user_id)
      DESC
    SQL
    tags = []
    data[0...n].each do |tag_data|
      tags << Tag.new(tag_data)
    end
    tags
  end


  def initialize(options = {})
    @id = options['id']
    @tag = options['tag']
  end

  def most_popular_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT
        q.*
      FROM
        question_tags qt
      JOIN
        question_likes ql
      ON
        qt.question_id=ql.question_id
      JOIN
        questions q
      ON
        q.id = qt.question_id
      WHERE
        qt.tag_id = ?
      GROUP BY
        qt.question_id
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

end

class QuestionTag

  attr_accessor :id, :tag_id, :question_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_tags")
    qtags = []
    data.each do |qtag_data|
      qtags << QuestionTag.new(qtag_data)
    end
    qtags
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.get_first_row("SELECT * FROM question_tags WHERE id=?", id)
    QuestionTag.new(data)
  end

  def initialize(options = {})
    @id = options['id']
    @tag_id = options['tag_id']
    @question_id = options['question_id']
  end

end