require_relative "./page.rb"

# would deal with anny assertions, logging, etc
class LoginPage < Page
    def initialize
        puts "navigating to login page if not here"
    end

    def enter_password password
        puts "types password into field"
    end

    def enter_username username
        puts "types username into field"
    end

    def submit_form
        puts "pushes the login button"
    end
end