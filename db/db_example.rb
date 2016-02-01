require 'sqlite3'

db = SQLite3::Database.new("example.rb")

#rows = db.execute("create table students (
#                  id integer primary key,
#                  name text,
#                  birth date)")

db.execute('insert into students
              (name, birth) values
              ("Pedro", "1999-02-28")')
rows = db.execute('select * from students')
p rows

db.execute('select id, name from students') do |row|
  puts "#{ row[0] }: #{ row[1] }"
end
