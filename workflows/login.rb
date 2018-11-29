# pat's first shot a test
require_relative "./workflow.rb"

class Login < Workflow
    #probably implement a test-superclass, or use a framework for that?

    def run
        super
        @user.login
    end
end