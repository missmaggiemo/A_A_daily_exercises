require "singleton"
require "sqlite3"
require 'active_support/inflector'

require_relative 'questions_user'
require_relative 'questions_question'
require_relative 'questions_reply'
require_relative 'questions_like'
require_relative 'questions_follower'
require_relative 'questions_tag'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super("questions.db")

    self.results_as_hash = true
    self.type_translation = true
  end

end

class QuestionClass

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM #{self.underscore.pluralize}")
    data.each_with_object([]) do |class_data, class_arr|
      class_arr << self.new(class_data)
    end
  end

  def self.find_by_id(id)
    attrs = {:table => self.underscore.pluralize, :id => id}
    data = QuestionsDatabase.instance.get_first_row(<<-SQL, attrs)
      SELECT
        *
      FROM
        #{self.underscore.pluralize}
      WHERE
        id = :id
    SQL
    self.new(data)
  end

  def save
    raise "already saved!" unless self.id.nil?

    attrs = {}
    # => [:@id, :@question_id, :@reply_id, :@user_id, :@body]
    vars = self.instance_variables.map { |var| var.to_s.gsub("@", "").to_sym }
    vars.each { |var| attrs[var] = self.send(var) }

    # attrs = {:fname => self.fname, :lname => self.lname}
    QuestionsDatabase.instance.execute(<<-SQL, attrs)
      INSERT INTO
        #{self.underscore.pluralize} (#{attrs.keys.join(", ")})
      VALUES
        (#{ ":" + attrs.keys.join(', :') })
    SQL

    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

end