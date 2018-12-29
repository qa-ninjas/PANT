require_relative "./workflow.rb"

# 
#   AddHome:        Workflow class that adds a home into our system.
class AddHome < Workflow
    
    def initialize 
        super
    end

    def run
        @user.login
        screen  = @user.page_builder.new_homes_page
        screen.add_homeowner
    end

    def post_run
        sleep 3
        super
    end

end