require 'socket'
require 'faraday'
require './lib/response'

class Server

  def start_server
    tcp_server = TCPServer.new(9292)
    counter = 0
    loop do
        puts "Ready for request:"
        client = tcp_server.accept
        request = store_request(client)

      client.gets
      output  = "Hello World!(#{counter})"
      headers = ["http/1.1 200 ok",
                "content-length: #{output.length}\r\n\r\n"].join("\r\n")
      client.puts headers
      client.puts output
      counter += 1
      client.close
    end
  end
end
