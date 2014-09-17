require 'socket'
require 'logger'

# set up our TCP server listener
server = TCPServer.new("#{ENV["OPENSHIFT_HSKT_IP"]}",22222)
log = Logger.new("#{ENV["OPENSHIFT_LOG_DIR"]}/hskt.log")
log.debug("Log file opened...")
loop do
  client = server.accept    # Wait for a client to connect
  client.puts "Hello socket! The time is #{Time.now}\r\n"
  File.readlines("#{ENV["OPENSHIFT_REPO_DIR"]}/outputfile.txt").each do |line|
    client.puts "#{line}"
  end
  log.debug("Client connected: #{Time.now}")
  client.close
end
