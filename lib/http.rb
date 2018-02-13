# require 'socket'
#
#
#   server = TCPServer.new 9292
#
#   while session = server.accept
#     request = session.gets
#     puts request
#
#     session.print "HTTP/1.1 200\r\n" # 1
#     session.print "Content-Type: text/html\r\n" # 2
#     session.print "\r\n" # 3
#     session.print "Hello world! The time is #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}" #4
#
#     session.close
#
# end
require 'pry'
require 'socket'
tcp_server = TCPServer.new(9292)
client = tcp_server.accept

puts "Ready for a request"
request_lines = []
while line = client.gets and !line.chomp.empty?
  request_lines << line.chomp
end

puts "Got this request:"
puts request_lines.inspect

puts "Sending response."
response = "<pre>" + request_lines.join("\n") + "</pre>"
output =  "hello world#{counter}"
headers = ["http/1.1 200 ok",
          "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
          "server: ruby",
          "content-type: text/html; charset=iso-8859-1",
          "content-length: #{output.length}\r\n\r\n"].join("\r\n")

client.puts headers
client.puts output
puts ["Wrote this response:", headers, output].join("\n")
client.close
puts "\nResponse complete, exiting."
