require_relative "./page.rb"

# would deal with anny assertions, logging, etc



class LoginPage < Page
    # UI MAPPING
    USERNAME_FIELD = "CSS SELECTOR";

    def initialize url, driver
        super
        puts "navigating to login page if not here"
    end

    def enter_password password
        puts "types password into field"      
    end

    def enter_username username
        puts "types username into field"
#        elem = Driver.findELement(USERNAME_FIELD)
#        Driver.send_keys(elem, username)
# TODO IMPLEMENT
    end

    def submit_form
        puts "pushes the login button"
    end
end