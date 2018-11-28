#### hardcoded main to run a test... will reorganize later

require 'io/console'
require_relative './workflows/login'

 input = {}

puts "Put in username then password"
print "Username: "
input[:username] = gets.chomp

print "Password: "
input[:password] = STDIN.noecho(&:gets)

print "\nhost name? (https://<example.com> /path. Give me <> part plz \n"
input[:hostname] = gets.chomp


puts "---- #### TEST START #### ----"
login_test = Login.new input
puts login_test.run
