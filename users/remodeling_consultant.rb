require_relative "../pages_controller.rb"
require_relative "./users.rb"

class RemodelingConsultant < User

    attr_accessor :username, :password, :controller

    def initialize username, password
        super
        # any RC specific initilization done here
    end

    def estimate_appointment
        @controller.estimate_appointment
    end

    

end

# class RemodelingConsultant < SalesGroup
#     include User
# end
# probably okay to just do one "sales" role for now

# as far as the appointment is concerned, itll run the same
# if we want to extend behavior for more specific types of sales
#  ie photos tab? we can do that later... different ways to approach 
#  that we should talk about before we dive in further