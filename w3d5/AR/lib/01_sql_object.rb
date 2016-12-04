require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    result =  DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        "#{self.table_name}"
      LIMIT
        1
    SQL
    @columns = result.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      define_method("#{col}") do
        self.attributes[col]
      end

      define_method("#{col}=") do |val|
        self.attributes[col] = val  #SCOPE LEVEL INSTANCE OF
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name.nil? ? self.to_s.tableize : @table_name
  end

  def self.all
    result = DBConnection.execute(<<-SQL)
      SELECT
        "#{table_name}".*
      FROM
        "#{table_name}"
    SQL
    parse_all(result)
  end

  def self.parse_all(results)
    objects = []
    results.each do |object|
      objects << self.new(object)
    end
    objects
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        "#{table_name}"
      WHERE
        id = ?
    SQL
    return nil if result.first.nil?
    self.new(result.first)
  end

  def initialize(params = {})
    params.each do |column, value|
      column = column.to_sym
      raise "unknown attribute '#{column}'" unless self.class.columns.include?(column)
      self.send("#{column}=", value)
    end
  end

  def attributes
    @attributes ||= {}
    return @attributes if @attributes
    result = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
    SQL
    @attributes = result
  end

  def attribute_values
    @attributes.values
  end

  def insert
    cols = self.class.columns[1..-1]
    vals = attribute_values
    question_marks = (['?'] * cols.length)
    # debugger
    DBConnection.execute(<<-SQL, vals)
      INSERT INTO
        #{self.class.table_name} (#{cols.map(&:to_s).join(', ')})
      VALUES
        (#{question_marks.join(',')})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    cols = self.class.columns[1..-1].map {|col| "#{col} = ?"}
    vals = attribute_values[1..-1]
    question_marks = (['?'] * cols.length)
    # debugger
    DBConnection.execute(<<-SQL, vals)
      UPDATE
      #{self.class.table_name}
      SET
        #{cols.join(',')}
      WHERE
        id = #{self.attribute_values.first}
    SQL
  end

  def save
    if self.id
      self.update
    else
      self.insert
    end
  end
end
