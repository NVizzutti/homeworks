require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'

module Searchable
  def where(params)
    cols = params.keys.map { |col| "#{col} = ?"}
    vals = params.values
    debugger
  result = DBConnection.execute(<<-SQL, vals)
    SELECT
      #{self.table_name}.*
    FROM
      #{self.table_name}
    WHERE
      #{cols.join(' AND ')}
    SQL
    parse_all(result)
  end
end

class SQLObject
  extend Searchable
end
