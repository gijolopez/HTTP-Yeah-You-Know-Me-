class Parser
  attr_reader :request_lines
  
  def initialize(request_lines)
    @request_lines = request_lines
  end

  def verb
  end

  def path
  end

  def protocol
  end

  def host
  end

  def origin
  end

  def accept
  end
end
