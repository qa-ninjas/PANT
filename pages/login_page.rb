require_relative "./page.rb"
# would deal with anny assertions, logging, etc



class LoginPage < Page
    # UI MAPPING
    USERNAME_FIELD = { :name => "email"}
    PASSWORD_FIELD = { :name => "password"}
    LOGIN_BUTTON =   { :name => "button"}
        
    # Builds the LoginPage
    def initialize url:, driver:, wait:
        super
        puts "navigating to login page if not here"
        navigate_to @url
    end

    # enters the password in the password field
    def enter_password password
        puts "types password into field" 
        send_keys_to_element(PASSWORD_FIELD, password)
    end

    # enters the username in the username field
    def enter_username username
        puts "types username into field"
        send_keys_to_element(USERNAME_FIELD, username)
    end

    # submits the form!
    def submit_form
        puts "pushes the login button"
        click_button LOGIN_BUTTON
        
        if (current_path == "/sessions")
            raise StandardError, "Couldn't Log In"
        end
    end
end
