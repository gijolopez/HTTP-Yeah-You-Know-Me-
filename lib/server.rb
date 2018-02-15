require 'socket'
require 'faraday'
require './lib/parser'
require 'pry'

class Server
  attr_reader :request_lines, :client

  def initalize
    @request_lines = []
  end

  def start_server
    @request_lines = []
    server = TCPServer.new(9292)
    parser = Parser.new(@request_lines)
    requests = 0
    loop do
      puts "Ready for request:"
      client = server.accept
      request = store_request(client)
      requests += 1
      end
    @client.close
  end

  def store_request(client)
    while line = client.gets and !line.chomp.empty?
      @request_lines << line
    end
  end
end
