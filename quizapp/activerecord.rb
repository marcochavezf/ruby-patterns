require 'sqlite3'
require 'date'

DATABASE_NAME = 'example.db'

class ActiveRecord

  DATABASE = SQLite3::Database.new(DATABASE_NAME)

  def self.int_field(name)
    new_field(name, :int)
  end

  def self.text_field(name)
    new_field(name, :text)
  end

  def self.date_field(name)
    new_field(name, :date)
  end

  def self.new_field(name, type)
    @fields ||= [] 
    @fields << [name, type]
    attr_accessor name
  end

  def self.create_table
    @table_name = self.name.downcase
    @fields ||= []
    @fields.insert(0, [:id, "integer primary key"])
    command_string = "create table if not exists #{ @table_name } (" \
                     + @fields.collect { |name, type| "#{ name } #{ type }" }.join(', ') \
                     + ")"
    DATABASE.execute(command_string)
  end

  def self.field_names
    @fields.collect {|name, _| name}
  end

  def self.field_type(name)
    @fields.each do |n, t|
      if n == name
        return t
      end
    end
    nil
  end

  def self.find(id)
    command_string = "select #{ field_names.join(', ') } " \
                     + "from #{ @table_name } where id=?"
    result = DATABASE.get_first_row(command_string, id)
    return nil unless result
    new(Hash[field_names.zip(result)])
  end

  def self.find_all
    names = field_names
    command_string = "select #{ names.join(', ') } " \
                     + "from #{ @table_name }"
    DATABASE.execute(command_string).collect { |row| new(Hash[names.zip(row)]) }
  end

  attr_reader :id

  def initialize(args={})
    @table_name = self.class.name.downcase
    set_fields_with_nil
    set_fields_with_args(args)
  end

  def save
    names = self.class.field_names
    names.delete_at(0) # Exclude id
    values = field_values(names)
    if @id.nil?
      command_string = \
        "insert into #{ @table_name } (" \
        + names.join(', ') \
        + ') values ' \
        + "(#{ (['?'] * names.length).join(', ') })"
      DATABASE.execute(command_string, values)
      @id = DATABASE.get_first_value("select max(id) from #{ @table_name }")
    else
      command_string = \
        "update #{ @table_name } set " \
        + names.collect {|name| "#{ name }=?"}.join(', ') \
        + " where id=?"
      values << @id
      DATABASE.execute(command_string, values)
    end
    nil
  end

  def delete
    if not @id.nil?
      command_string = "delete from #{ @table_name } where id=?"
      DATABASE.execute(command_string, @id)
    end
    nil
  end

  private

  def set_fields_with_nil
    self.class.field_names.each { |name| instance_variable_set("@#{ name }", nil) }
  end

  def set_fields_with_args(args)
    args.each do |name, value|
      if self.class.field_type(name) == :date
        if value.kind_of? String and value.size != 0
          value = Date.parse(value)
        elsif not value.kind_of? Date
          value = nil
        end
      end
      instance_variable_set("@#{ name }", value)
    end
  end

  def field_values(names)
    names.collect { |name| instance_variable_get("@#{ name }").to_s }
  end

end