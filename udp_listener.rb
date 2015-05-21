require 'socket'
require 'ipaddr'
puts "Initiating listener"
bind_addr = "0.0.0.0"
port = 3728
multicast_address = "230.31.32.33"
socket = UDPSocket.new
membership = IPAddr.new(multicast_address).hton + IPAddr.new(bind_addr).hton
      socket.setsockopt(:IPPROTO_IP, :IP_ADD_MEMBERSHIP, membership)
      socket.setsockopt(:SOL_SOCKET, :SO_REUSEADDR, 1)
      socket.bind(bind_addr, port)

        loop do
          message = socket.recvfrom(512).first
          puts "#{message}"
        end
