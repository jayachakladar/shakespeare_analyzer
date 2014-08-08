require 'open-uri'
require 'nokogiri'

class Macbeth

  attr_accessor :doc, :sorted_list

  def initialize
    read_xml
    count_lines
  end

  def print_lines
    @sorted_list.map{ |x| puts "#{x[1]} #{x[0]}"}
  end

  def count_lines
    b = Hash.new(0)
    @doc.xpath("//SPEECH").each do |sp|
      b[sp.css("SPEAKER").text] += sp.css("LINE").count
    end
    @sorted_list = b.sort_by{|k,v| v}.reverse!
  end


  def read_xml
    @doc = Nokogiri::XML(open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"))
  end
end
