require 'minitest/autorun'
require 'minitest/pride'
require './lib/request'

class RequestTest < Minitest::Test
  def test_it_exist
    request = Request.new

    assert_instance_of Request, request
  end


end
