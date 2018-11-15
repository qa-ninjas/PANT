# pat's first shot a test


require_relative "../users/user"
require_relative "../pages_collection"
require_relative "../users/remodeling_consultant"

class LoginTest
    #probably implement a test-superclass, or use a framework for that?


    # for example, this type of init can likely be standardized?
    # maybe not, if we want to do multi-user tests?
    # better left as two separate tests run in series?
    # could be reasonable that any one test must be one user only
    # and we could come up with a clever way to string em together.
    def initialize username, password, hostname
    
        @controller = PagesCollection.new("https://" + hostname)
        @user = User.new(username, password, @controller)
    end

    def run
        @user.login
    end
end