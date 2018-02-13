require 'minitest/autorun'
require 'minitest/pride'
require './lib/server'

class ServerTest < Minitest::Test

  def test_it_exist
    server = Server.new

    assert_instance_of Server, server
  end

  def test_

  end

end
