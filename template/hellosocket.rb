require 'socket'

server = TCPServer.new("#{ENV["OPENSHIFT_HSKT_IP"]}",22222)
loop do
  client = server.accept    # Wait for a client to connect
  client.puts "Hello socket!"
  client.puts "Time is #{Time.now}"
  puts "Someone connected @#{Time.now}"
  client.close
end
