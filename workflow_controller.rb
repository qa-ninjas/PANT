require_relative "./workflows/login"
require_relative "./workflows/workflow"

class WorkflowController

    def initialize(commands:)
        @commands = commands
    end

    def run_workflows

        @commands.each do |command|
            workflow = find_workflow(command[:workflow])
            puts workflow
            workflow.setup(:user => command[:user], :input => command[:input])
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




    # def login input
    #     return Login.new(input)
    # end

end
