require 'socket'
# require 'faraday'
require './lib/response'
require 'pry'

class Server
  attr_reader :request_lines,
              :client

  def initalize
    @request_lines = []
  end

  def start_server
    @request_lines = []
    server = TCPServer.new(9292)
    loop do
      parser = Parser.new(@request_lines)
      client = server.accept
    while line = client.gets and !line.chomp.empty?
      @request_lines << line
    end
    binding.pry
    client.close
    end
  end
end
