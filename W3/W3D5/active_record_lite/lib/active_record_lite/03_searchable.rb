require_relative 'db_connection'
require_relative '02_sql_object'

module Searchable
  
  def where(params)       
    results = DBConnection.execute(<<-SQL)
      SELECT 
        *
      FROM 
        #{self.table_name}
      WHERE 
        #{params.map { |attribute, val| attribute.to_s + '=' + "'" + val.to_s + "'" }.join(' AND ')}
    SQL
    parse_all(results)
  end
  
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
  
end
