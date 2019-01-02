# pat's first shot a test
require_relative "./workflow.rb"

class Login < Workflow
    
    def run
        super
        @user.login
        
        #page = @user.current_page
        # this was included to test the "Begin... Ensure " bit of the workflow controller
        # if(page.title.include? @input[:title])
        #     ##included for testing 
        #     raise StandardError, "Sales User!"
        # end
    end

    def post_run
        sleep 3
        #added so login can be verified, closed instantly otherwise
        super
    end

end