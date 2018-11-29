require_relative "./workflows/login"
require_relative "./workflows/workflow"

class WorkflowController

    def initialize(workflows:)
        @commands = workflows[:commands]
        @hostname = workflows[:hostname]
    end

    def run_workflows
        ## maybe implement a way to check if user is blank, and use a previous user if none is given for
        # a subsequent command
        @commands.each do |command|
            workflow = find_workflow(command[:workflow])
            puts workflow
            workflow.setup(:user => command[:user], :input => command[:input], :hostname => @hostname)
            workflow.run

        end
    end


    def find_workflow type
        puts "finding workflow type"
        test = nil

        types = {
            "login" => Login.new
        }

        return types[type]
    end

end
