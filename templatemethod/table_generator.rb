# Lab 2: Template Method
# Date: 25-Jan-2012
# Author: Marco Chávez
# File name: table_generator.rb

class TableGenerator
  
  def initialize(header, data)
    @header = header
    @data = data    
  end
  
  def generate
    generate_header_row + (@data.map {|x| generate_row(x)}).join
  end
  
  def generate_header_row    
    (@header.map {|x| generate_header_item(x)}).join
  end
  
  def generate_item(item)
    item
  end
  
  def generate_row(row)
    (row.map {|x| generate_item(x)}).join
  end
  
  def generate_header_item(item)
    item
  end
end

class CSVTableGenerator < TableGenerator
  
  def generate_row(row)
    "#{(row.map {|x| generate_item(x)}).join(',')}\n"
  end
  
  def generate_header_row
    generate_row(@header)
  end
    
end

class HTMLTableGenerator < TableGenerator
  
  def generate
    "<table>\n#{generate_header_row + (@data.map {|x| generate_row(x)}).join}</table>\n"
  end  
  
  def generate_row(row)
    "<tr>#{(row.map {|x| generate_item(x)}).join}</tr>\n"
  end
  
  def generate_item(item)
    "<td>#{item}</td>"
  end
  
  def generate_header_row
    #"<tr>#{super.generate_header_row}</tr>\n"
    "<tr>#{(@header.map {|x| generate_header_item(x)}).join}</tr>\n"
  end
  
  def generate_header_item(item)
    "<th>#{item}</th>"
  end
    
end

class AsciiDocTableGenerator < TableGenerator
  def generate
    optionsheader + asciiheader + generate_header_row + (@data.map {|x| generate_row(x)}).join + asciiheader
  end
  
  def optionsheader
    "[options=\"header\"]\n"
  end
  
  def asciiheader
    "|==========\n"
  end
  
  def generate_row(row)
    "|#{(row.map {|x| generate_item(x)}).join('|')}\n"
  end
  
  def generate_header_row
    generate_row(@header)
  end
end
