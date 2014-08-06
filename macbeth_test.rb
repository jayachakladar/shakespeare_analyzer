require 'test/unit'
require './macbeth.rb'

class MacbethTest < Test::Unit::TestCase
  # this slows down run time though !
  def setup
   @@m = Macbeth.new
 end
 def test_new
   assert_instance_of Macbeth, @@m
 end

 def test_read_xml
   doc = @@m.read_xml
   assert_not_nil doc
 end

 def test_find_actors

 end

 def test_count_line

 end

end
