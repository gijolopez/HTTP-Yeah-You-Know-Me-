

    client.gets
    output  = "Hello World!(#{counter})"
    headers = ["http/1.1 200 ok",
              "content-length: #{output.length}\r\n\r\n"].join("\r\n")
    client.puts headers
    client.puts output
    counter += 1
    client.close
