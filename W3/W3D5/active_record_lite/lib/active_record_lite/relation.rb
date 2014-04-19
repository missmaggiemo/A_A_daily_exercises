require_relative 'db_connection'
require_relative '02_sql_object'

class Relation
  
  def initialize(table_name, params)
    @table_name = table_name
    @where_info ||= [params.keys.map { |attribute| "#{attribute.to_s} = ?" }.join(' AND ')]
    @where_vals ||= params.values
  end
  
  def run_execute
    # execute _all_ of the queries
    
    results = DBConnection.execute(<<-SQL, @where_vals)
      SELECT 
        *
      FROM 
        #{@table_name}
      WHERE 
        #{@where_info.join(' AND ')}
    SQL
    
    # parse_all(results)
  end
  
  def where(params)
    # adds other "where" query info...
    
    @where_info << params.keys.map { |attribute| "#{attribute.to_s} = ?" }.join(' AND ')
    @where_vals += params.values
  end
  
  # collect all the "where"s and the info in it, when it executes, join all the info with "AND"s, execute!
  
  # where_info = params.keys.map { |attribute| "#{attribute.to_s} = ?" }.join(' AND ')
#   where_vals = params.values
        
end