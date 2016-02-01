require 'sqlite3'

class Student
  DATA_BASE = SQLite3::Database.new("example.rb")
  def self.find(id)
    row = DATA_BASE.get_first_row("select id, name, birth from students where id=?",[id])
    Student.new(id: row[0], name: row[1], birth: row[2]) if row
  end
  
  def self.find_all
    DATA_BASE.execute('select id, name, birth from students')\
      .collect { |row| Student.new(id: row[0], name: row[1], birth: row[2]) }
  end
  
  attr_accessor :id, :name, :birth
  
  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    birth = args[:birth]
    @birth = birth.kind_of?(String) ? Date.parse(birth) : birth
  end
  
  def age
    ((Date.today - birth) / 365).to_i
  end
  
  def save
    if @id.nil?
      DATA_BASE.execute('insert into students (name, birth) values (?, ?)', [@name, @birth.to_s])
      # assign @id
    else
      DATA_BASE.execute('update students set name=?, birth=? where id=?',[@name, @birth.to_s, @id])
    end
  end
  
  def delete
    if not @id.nil?
      DATA_BASE.execute('delete from students where id=?',[@id])
    end
  end
end

Student.find_all.each do |s|
  puts "#{s.name} #{s.birth}"
end


#s = Student.find(3)
#s.name = "Petra"
#s.birth = Date.new(2005, 5, 28)
#s.save
#
#s = Student.find(3)
#s.delete
