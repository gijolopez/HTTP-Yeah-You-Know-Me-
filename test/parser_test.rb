require 'minitest/autorun'
require 'minitest/pride'
require './lib/parser'
require 'pry'

class ParserTest < Minitest::Test

  def setup
    @request_lines = ["GET / HTTP/1.1\r\n",
                     "Host: localhost:9292\r\n",
                     "Connection: keep-alive\r\n",
                     "Cache-Control: max-age=0\r\n",
                     "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36\r\n",
                     "Upgrade-Insecure-Requests: 1\r\n",
                     "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8\r\n",
                     "Accept-Encoding: gzip, deflate, br\r\n",
                     "Accept-Language: en-US,en;q=0.9\r\n"]
    @parser = Parser.new(@request_lines)
  end

  def test_it_exist
    assert_instance_of Parser, @parser
  end

  def test_output_of_request_lines
    assert_equal @request_lines, @parser.request_lines
  end

  def test_verb
    assert_equal "GET", @parser.verb
  end

end
