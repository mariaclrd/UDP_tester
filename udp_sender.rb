require 'socket'
require 'ipaddr'
puts "Initiating sender"
port = 3728
multicast_address = "230.31.32.33"
socket = UDPSocket.open
socket.setsockopt(:IPPROTO_IP, :IP_MULTICAST_TTL, 1)
puts "Message sent #{ARGV[0]}"
socket.send(ARGV[0], 0, multicast_address, port)
socket.close
