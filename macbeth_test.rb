require './macbeth.rb'
require "minitest/autorun"

class MacbethTest < MiniTest::Unit::TestCase
  # this slows down run time though !
  def setup
   @@m = Macbeth.new
 end
 def test_new
   assert_instance_of Macbeth, @@m
 end

 def test_read_xml
   doc = @@m.read_xml
   refute_nil doc
 end

 def test_count_line
  assert_kind_of Array, @@m.sorted_list
  assert_operator @@m.sorted_list.count, :>, 0
 end

end
