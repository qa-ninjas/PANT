#### hardcoded main to run a test... will reorganize later

require 'io/console'
require_relative './workflows/login'
require_relative 'workflow_controller.rb'

input = {}
user = {}

puts "Put in username then password"
print "Username: "
user[:username] = gets.chomp

print "Password: "
user[:password] = STDIN.noecho(&:gets)

print "\nhost name? (https://<example.com> /path. Give me <> part plz \n"
input[:hostname] = gets.chomp

commands = [{:workflow => "login", :user => user, :input => input}]


puts "---- #### TEST START #### ----"
workflow_controller = WorkflowController.new(commands: commands)

puts "running workflows"
workflow_controller.run_workflows

