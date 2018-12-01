#!/usr/bin/env ruby
#### hardcoded main to run a test... will reorganize later

require 'io/console'
require 'json'
require_relative './workflows/login'
require_relative 'workflow_controller.rb'

file = ARGV.first

workflows = JSON.parse(File.read(file), :symbolize_names => true) if file

if workflows.instance_of?(Hash)
    puts workflows
    puts workflows["commands"]
    commands = workflows[:commands]
else
    input = {}
    user = {}

    puts "Put in username then password"
    print "Username: "
    user[:username] = gets.chomp

    print "Password: "
    user[:password] = STDIN.noecho(&:gets)

    print "\nhost name? (https://<example.com> /path. Give me <> part plz \n"
    hostname = gets.chomp
    commands = [{:workflow => "login", :user => user, :input => input}]
    workflows = {:hostname => hostname, :commands => commands}
end


puts "---- #### TEST START #### ----"
workflow_controller = WorkflowController.new(workflows: workflows)

puts "running workflows"
workflow_controller.run_workflows
