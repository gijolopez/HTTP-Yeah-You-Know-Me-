require 'socket'
require 'faraday'

host = 'localhost'
port = 9292

socket = TCPSocket.new(host, port)

msg = "GET / HTTP/1.1\r\n" +
      "Accept: */*\r\n" +
      "User-Agent: Ruby/1.0\r\n"
      "Host: #{host}: #{port}\r\n" +
      "\r\n"

socket.write(msg)

puts "Response:"


while line = socket.gets
  puts line
end

socket.close unless socket.closed?
