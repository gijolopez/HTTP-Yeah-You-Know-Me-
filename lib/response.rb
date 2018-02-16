class Response
    attr_reader :hellos

  def initialize
    @hellos = -1
      # @game = game
  end

  def hello
    @hellos += 1
    "Hello, World! (#{@hellos /2})"
  end

  def datetime
    "#{Time.now.strftime('%I:%M%p on %A, %B %e, %Y')}"
  end

  def headers(length)
    headers = ["http/1.1 200 ok",
      "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
      "server: ruby",
      "content-type: text/html; charset=iso-8859-1",
      "content-length: #{length}\r\n\r\n"].join("\r\n")
  end

  def total_response(body)
    headers(body.length)+ body
  end
end
