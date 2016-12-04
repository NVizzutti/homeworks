require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    name = name.to_s
    options[:foreign_key] = "#{name}_id".to_sym unless options[:foreign_key]
    options[:primary_key] = :id unless options[:primary_key]
    options[:class_name] = "#{name.capitalize!}" unless options[:class_name]
    @foreign_key, @primary_key, @class_name = options[:foreign_key], options[:primary_key], options[:class_name]
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    name = name[0...-1] if name[-1] == 's'
    options[:primary_key] = :id unless options[:primary_key]
    options[:foreign_key] = "#{self_class_name.downcase}_id".to_sym unless options[:foreign_key]
    options[:class_name] = "#{name.capitalize!}" unless options[:class_name]
    @primary_key, @foreign_key, @class_name = options[:primary_key], options[:foreign_key], options[:class_name]
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    obj = BelongsToOptions.new(name, options)
    debugger
    define_method(name) do
      primary_key = obj.primary_key
      foreign_key = obj.foreign_key
      obj.model_class.where(primary_key => foreign_key).first
    end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
  # Mixin Associatable here...
end
