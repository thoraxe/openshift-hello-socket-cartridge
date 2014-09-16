require 'socket'

server = TCPServer.new 22222
loop do
  client = server.accept    # Wait for a client to connect
  client.puts "Hello socket!"
  client.puts "Time is #{Time.now}"
  puts "Someone connected @#{Time.now}"
  client.close
end
