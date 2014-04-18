require_relative 'db_connection'
require_relative '01_mass_object'
require_relative '00_attr_accessor_object.rb'

require 'active_support/inflector'

class MassObject < AttrAccessorObject
    
  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end
  end
end

class SQLObject < MassObject
    
  def self.columns
    results = DBConnection.execute2("SELECT * FROM #{self.table_name}")
    results.first
  end

  def self.table_name=(table_name)
    @table = table_name
  end

  def self.table_name
    unless self.to_s.downcase == 'human'
      @table = self.to_s.downcase.pluralize
    else
      @table = 'humans'
    end
  end

  def self.all
    all_results = DBConnection.execute("SELECT * FROM #{self.table_name}")
    parse_all(all_results)
    # p DBConnection.execute2("SELECT * FROM #{self.table_name}")
  end

  def self.find(id)
    raise "ID must be an integer!" if id.to_s == 0
    find_result = DBConnection.execute("SELECT * FROM #{self.table_name} WHERE id=#{id}").first
    find_result.keys.map!(&:to_sym)
    
    self.new(find_result)
  end

  def attributes
    # ...
  end

  def insert
    raise "already inserted!" unless self.id.nil?

    attrs = {}
    vars = self.class.columns.map { |var| var.to_s.gsub("@", "").to_sym }
    vars.each { |var| attrs[var] = self.send(var) }

    DBConnection.execute(<<-SQL, attrs)
      INSERT INTO
        #{self.class.table_name} (#{attrs.keys.join(", ")})
      VALUES
        (#{ ":" + attrs.keys.join(', :') })
    SQL
    
    self.id = DBConnection.last_insert_row_id

  end
  
  def initialize(options={})
    @attributes = self.class.columns
        
    raise "Not enough information!" if options.keys.length < @attributes.length - 1
    
    @attributes.each do |attribute|
      if options[attribute.to_sym]
        instance_variable_set('@' + attribute, options[attribute.to_sym])
      elsif options[attribute]
        instance_variable_set('@' + attribute, options[attribute])
      else
        instance_variable_set('@' + attribute, nil)
      end
    end
    
    self.class.my_attr_accessor(*@attributes.map(&:to_sym))
  end

  def save
    self.id.nil? ? self.insert : self.update
  end

  def update
    
    attrs = {}
    vars = self.class.columns.map { |var| var.to_s.gsub("@", "").to_sym }
    vars.each { |var| attrs[var] = self.send(var) }
    
    DBConnection.execute(<<-SQL)
      UPDATE 
      #{self.class.table_name}
      SET 
      #{attrs.map { |attribute, val| attribute.to_s + '=' + "'" + val.to_s + "'" }.join(', ')}
      WHERE 
        id=#{self.id}
    SQL
  end

  def attribute_values
    @attributes.each.with_object([]) do |attribute, attr_list|
      attr_list << self.send(attribute.to_sym)
    end
  end
end
