class Parser
  attr_reader :request_lines

  def initialize(request_lines)
    @request_lines = request_lines
  end

  def verb
    @request_lines[0].split[0]
  end

  def path
    @request_lines[0].split[1].split("?")[0]
  end

  def protocol
    @request_lines[0].split[2]
  end

  def host
    @request_lines[1].split(":")[1].strip
  end

  def port
    @request_lines[1].split(":")[2].strip
  end

  def accept
    accept_line = @request_lines.find do |line|
            line.include?("Accept:")
        end.split[1]
        accept_line
  end
end
