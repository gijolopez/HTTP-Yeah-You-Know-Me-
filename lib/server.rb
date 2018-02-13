require 'socket'
require 'faraday'

class Server
  def start_server
    tcp_server = TCPServer.new(9292)
    counter = 0
    while client = tcp_server.accept
    # request_lines = []
    # while line = client.gets and !line.chomp.empty?
    #   request_lines << line.chomp
    # end
    client.gets
    output  = "Hello World!(#{counter})"
    headers = ["http/1.1 200 ok",
              "content-length: #{output.length}\r\n\r\n"].join("\r\n")
    client.puts headers
    client.puts output
    counter += 1
  end
  client.close
  end

end

Server.new.start_server
