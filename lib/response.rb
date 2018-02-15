class Response
    attr_reader :hellos

    def initialize
        @hellos = -1
        @game = game
    end

    def hello
        @hellos += 1
        "Hello, World! (#{@hellos/2})"
    end

    def datetime
        "#{Time.now.strftime('%I:%M%p on %A, %B %e, %Y')}"
    end
  end
