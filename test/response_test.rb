require 'minitest/autorun'
require 'minitest/pride'
require './lib/response'

class ResponseTest < Minitest::Test

  def test_it_exist
    response = Response.new

    assert_instance_of Response, response
  end

end
