require_relative 'db_connection'
require_relative '02_sql_object'

module Searchable
  
  def where(params)
    
    where_info = params.keys.map { |attribute| "#{attribute.to_s} = ?" }.join(' AND ')
    where_vals = params.values
    # val.to_s = ?
          
    results = DBConnection.execute(<<-SQL, where_vals)
      SELECT 
        *
      FROM 
        #{self.table_name}
      WHERE 
        #{where_info}
    SQL
    parse_all(results)
  end
  
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
  
end
