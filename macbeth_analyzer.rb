require 'open-uri'
require 'nokogiri'


doc = Nokogiri::XML(open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"))
name_array = []
doc.xpath("//SPEAKER").children.each{|x| name_array << x.content()}
b = Hash.new(0)
name_array.each{|v|  b[v] += 1}
sorted_list = b.sort_by{|k,v| v}.reverse!
sorted_list.map{ |x| puts "#{x[1]} #{x[0]}"}

