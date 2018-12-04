require_relative "./page.rb"
# would deal with anny assertions, logging, etc



class LoginPage < Page
    # UI MAPPING
    USERNAME_FIELD = { :name => "email"}
    PASSWORD_FIELD = { :name => "password"}
    LOGIN_BUTTON =   { :name => "button"}
    LOGIN_PATH = "/login"
        
    # Builds the LoginPage
    def initialize url:, driver:, wait:
        super
        puts "navigating to login page if not here"
        @driver.get @url + LOGIN_PATH
    end

    # enters the password in the password field
    def enter_password password
        puts "types password into field" 
        password_field = @wait.until { @driver.find_element(PASSWORD_FIELD) }
        password_field.send_keys password     
    end

    # enters the username in the username field
    def enter_username username
        puts "types username into field"
        email_field = @wait.until { @driver.find_element(USERNAME_FIELD) }
        email_field.send_keys username
    end

    # submits the form!
    def submit_form
        puts "pushes the login button"
        submit_form = @wait.until {@driver.find_element(LOGIN_BUTTON)}
        submit_form.click
    end
end