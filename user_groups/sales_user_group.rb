require_relative "../pages_controller.rb"
require_relative "./users.rb"

class SalesGroup 
    include User

    attr_accessor :username, :password, :controller

    def initialize username, password
        @username = username
        @password = password

        @controller = PagesController.new
    end

    def estimate_appointment
        @controller.estimate_appointment
    end

    def login
        @controller.login_page
    end

end

class RemodelingConsultant < SalesGroup
    include User
end