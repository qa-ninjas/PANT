require_relative "./login"
require_relative "./workflow"
require_relative "../users/user_builder"
require_relative "../pages/page_builder"

class WorkflowController
    include UserBuilder

    def initialize(workflows:)
        @commands = workflows[:commands]
        @hostname = workflows[:hostname]
        @page_builder = PageBuilder.new(@hostname)
    end

    def run_workflows
        current_user = nil

        @commands.each do |command|
            begin
                workflow = find_workflow(command[:workflow])
                puts workflow

                # first command must have a user
                # subsequent commands will use previous user
                current_user = build_user_from_input ({:user_info => command[:user], :page_builder => @page_builder}) if command[:user]
                workflow.setup(:user => current_user, :input => command[:input])
                workflow.run
            rescue => error
                p error
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
