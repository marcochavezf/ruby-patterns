require 'activerecord'

class Employee < ActiveRecord
  text_field :name
  int_field  :salary
  date_field :birthday
  create_table
  def age
    if @birthday.nil?
      nil
    else
      ((Date.today - @birthday) / 365).to_i
    end
  end
end

class Book < ActiveRecord
  text_field :title
  int_field  :year_published
  text_field :isbn
  create_table
end

#e = Employee.new(name: 'Martha')
#e.save
#
#b = Book.new(title: '1984', year_published: 1949, isbn: '123123123')
#e = Employee.find(1)
#e.birthday = Date.new(2000, 1, 31)
#e.save
#p e.age
p Hash[Employee.field_names.zip([1,2,3,4])]
p Employee.field_names
p Employee.field_type(:salary)

#e = Employee.new(name: 'John', salary: 20_000, birthday: Date.new(1990, 2, 28))
#e = Employee.new(name: 'John', salary: 20_000, birthday: '1990-02-28')
#
#e.save
#
#e = Employee.find(1)
#p e
#p e.age