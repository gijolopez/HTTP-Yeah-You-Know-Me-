require 'socket'
require 'faraday'
require './lib/parser'
require './lib/response'
require 'pry'

class Server
  attr_reader :request_lines

  def initalize
    @request_lines = []
  end

  def start_server
     @request_lines = []
    server = TCPServer.new(9292)
    requests = 0
    loop do
      puts "Ready for request:"
      client = server.accept
      store_request(client)
      response = get_response
      client.puts response
      requests += 1
      puts @request_lines
      client.close
    end
  end

  def store_request(client)
    while line = client.gets and !line.chomp.empty?
      @request_lines << line
    end
  end

  def get_response
    parser = Parser.new(@request_lines)
    response = Response.new
    body = parser.diagnostics
    response.total_response(body)
  end

  
end
