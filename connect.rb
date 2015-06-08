#! /usr/bin/env ruby

$connections = [
    {"user@host1.com" => "development server"},
    {"user@host2.com" => "QA test"}
  ]
 
Signal.trap("SIGINT") do
	puts ("\nexit")
	exit
end

def max_conn_size
  $connections.inject(0) do |max, element|
    element.keys.first.size if element.keys.first.size > max.to_i
  end
end

def print_connections
	$connections.each.with_index do |connection, index|
		conn, description = connection.first
		printf "%d) %-#{max_conn_size+3}s %s\n", index+1, conn, description
  end
end

def request_selection
  print "Pick a server (or ctrl-c to quit): "
  system("stty raw -echo")
  input = Integer(STDIN.getc)
  ensure
	system("stty -raw echo")
	print "#{input}\n"
end

def connect(selection)
  connection = $connections[selection-1].keys.first
  puts "Connecting to #{connection}"
  exec("ssh -X #{connection}")
end

def get_selection
if(ARGV[0]) 
		selection = Integer(ARGV[0])
	else
		print_connections
		selection = request_selection
	end
	if selection.between?(1, $connections.size)
		selection
	else
		raise ArgumentError 	
	end
	rescue ArgumentError
		puts "Invalid Argument. Selection must be between 1 and #{$connections.size}"
		exit -1
end

if __FILE__ == $0
	connect get_selection
end
