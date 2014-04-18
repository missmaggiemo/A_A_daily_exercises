require_relative 'db_connection'
require_relative '01_mass_object'
require_relative '00_attr_accessor_object'
# require_relative '03_searchable'


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
    @table_name = table_name
  end

  def self.table_name
    unless self.to_s.downcase == 'human'
      @table_name = self.to_s.downcase.pluralize
    else
      @table_name = 'humans'
    end
  end

  def self.all
    all_results = DBConnection.execute("SELECT * FROM #{self.table_name}")
    parse_all(all_results)
  end

  def self.find(id)
    raise "ID must be an integer!" if id.to_s == 0
    
    find_result = DBConnection.execute("SELECT * FROM #{self.table_name} WHERE id=#{id}").first
    # SQL injection!
    
    find_result.keys.map!(&:to_sym)
    
    self.new(find_result)
  end

  def attributes
    @attributes ||= {}
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
    @attributes = {}
    
    self.class.columns.each do |col|
      @attributes[col.to_sym] = nil
    end
      
    attributes.keys.each do |attribute|
      if options[attribute] || options[attribute.to_s]
        target_attr = options[attribute] || options[attribute.to_s]
        instance_variable_set('@' + attribute.to_s, target_attr)
        attributes[attribute] = target_attr
      else
        instance_variable_set('@' + attribute.to_s, nil)
      end
    end
    
    self.class.my_attr_accessor(*attributes.keys)
    # e.g., id, fname, lname, house_id
    # e.g., id, name, owner_id
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
    attributes.keys.each.with_object([]) do |attribute, attr_list|
      attr_list << self.send(attribute)
    end
  end
end
