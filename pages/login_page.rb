require_relative "./page.rb"

# would deal with anny assertions, logging, etc



class LoginPage < Page
    # UI MAPPING
    USERNAME_FIELD = "email"
    PASSWORD_FIELD = "password"
    LOGIN_BUTTON = "button"
    LOGIN_PATH = "/login"
        
    # Builds the LoginPage
    def initialize url, driver
        super
        puts "navigating to login page if not here"
        @driver.get @url + LOGIN_PATH
    end

    # enters the password in the password field
    def enter_password password
        puts "types password into field" 
        @driver.find_element(:name, PASSWORD_FIELD).send_keys password     
    end

    # enters the username in the username field
    def enter_username username
        puts "types username into field"
        @driver.find_element(:name, USERNAME_FIELD).send_keys username
    end

    # submits the form!
    def submit_form
        puts "pushes the login button"
        @driver.find_element(:name, "button").click
    end
end