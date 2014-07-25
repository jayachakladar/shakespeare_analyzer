require 'open-uri'
require 'nokogiri'

class Macbeth

  attr_accessor :doc, :name_array, :sorted_list

  def initialize
    read_xml
    find_actors
    count_lines
  end

  def print_lines
    @sorted_list.map{ |x| puts "#{x[1]} #{x[0]}"}
  end

  private
  def count_lines
    b = Hash.new(0)
    @name_array.each{|v| b[v] += 1}
    @sorted_list = b.sort_by{|k,v| v}.reverse!
  end


  def read_xml
    @doc = Nokogiri::XML(open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"))
  end

  def find_actors
    @name_array = []
    @doc.xpath("//SPEAKER").children.each{|x| @name_array << x.content()}
  end
end
