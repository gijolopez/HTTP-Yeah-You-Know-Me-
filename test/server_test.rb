require 'minitest/autorun'
require 'minitest/pride'
require './lib/server'

class ServerTest < Minitest::Test

  def test_it_exist
#    server = Server.new

    #assert_instance_of Server, server
  end

  def test_listens_to_port_9292
  #  server = Server.new
    # server.start_server
    response = Faraday.get "http://127.0.0.1:9292"
    # assert_equal start_server, server.start_server
  end

  def test_respond_to_http_request
    #server = Server.new

    # assert_equal start_server, server.start_server
  end
end
