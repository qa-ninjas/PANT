# pat's first shot a test
require_relative "./workflow.rb"

class Login < WorkFlow
    #probably implement a test-superclass, or use a framework for that?


    # for example, this type of init can likely be standardized?
    # maybe not, if we want to do multi-user tests?
    # better left as two separate tests run in series?
    # could be reasonable that any one test must be one user only
    # and we could come up with a clever way to string em together.
   
    def pre_run
        super
        #workflow specific startup
    end

    def run
        super
        @user.login
    end
end