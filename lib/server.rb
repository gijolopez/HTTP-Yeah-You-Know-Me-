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

  CODES = {
    200 => "HTTP/1.1 200 OK",
    301 => "HTTP/1.1 301 Moved Permanently",
    403 => "HTTP/1.1 403 Forbidden",
    404 => "HTTP/1.1 404 Not Found",
    500 => "HTTP/1.1 500 Internal Server Error"
    }

    SystemError = "The internet is broken!"

  def start_server
    @request_lines = []
    server = TCPServer.new(9292)
    @response = Response.new
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

  def web_responder(request, client)
    path = @parser.path(request)
    verb = @parser.verb(request)
    if path == "/" && verb == "GET"
        web_response = "#{diagnostics(request)}"
        output_formatter(client, web_response, 200)
        elsif path == "/hello" && verb == "GET"
        web_response = "<pre>" + @response.hello + "</pre>"
        output_formatter(client, web_response, 200)
        elsif path == "/datetime" && verb == "GET"
        web_response = @response.datetime
        output_formatter(client, web_response, 200)
        elsif path == "/shutdown"
        web_response = @response.shutdown(@requests)
        output_formatter(client, web_response, 200)
        shut_down
        elsif path == '/force_error'
        output_formatter(client, CODES[500], 500)
        raise SystemError
        else
        output_formatter(client, CODES[404], 404)
      end
  end

  def output_formatter(client, web_response, code)
        @output = "<html><head></head><body>#{web_response}</body></html>"
        client.puts headers(code)
        client.puts @output
    end

  def shut_down
        "shut down server"
    end
end
