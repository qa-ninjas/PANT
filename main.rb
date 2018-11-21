#### hardcoded main to run a test... will reorganize later

require 'io/console'
require_relative './workflows/login'

puts "Put in username then password"
print "Username: "
username = gets.chomp

print "Password: "
password = STDIN.noecho(&:gets)

print "\nhost name? (https://<example.com> /path. Give me <> part plz \n"
hostname = gets.chomp


puts "---- #### TEST START #### ----"
login_test = Login.new username, password, hostname
puts login_test.run
