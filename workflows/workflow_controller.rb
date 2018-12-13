require_relative "./login"
require_relative "./workflow"

class WorkflowController

    def initialize(workflows:)
        @commands = workflows[:commands]
        @hostname = workflows[:hostname]
    end

    def run_workflows
        current_user = nil

        @commands.each do |command|
            begin
                workflow = find_workflow(command[:workflow])
                puts workflow

                # first command must have a user
                # subsequent commands will use previous user
                current_user = command[:user] if command[:user]
                workflow.setup(:user => current_user, :input => command[:input], :hostname => @hostname)
                workflow.run
            ensure
                puts "Post Run!"
                workflow.post_run
            end
        end
    end


    def find_workflow type
        puts "finding workflow type"

        types = {
            "login" => Login.new
        }

        return types[type] || Workflow.new
    end

end
