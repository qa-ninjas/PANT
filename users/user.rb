require "selenium-webdriver"
require_relative "../pages_controller.rb"

class User
    # include page_controller do i need this? require/include..
    # i think i dont but lets see

    def initialize  username, password, pages_controller
        @username = username
        @password = password
       #  @driver = Selenium::WebDriver.for :firefox

        @controller = pages_controller
    end

    def login
        puts "user #{@username} is trying to log into #{@controller.host_name}"
        login_page = @controller.login_page
        # Driver. "Navigate to path"

        login_page.enter_username @username
        login_page.enter_password @password
        login_page.submit_form

        puts "login complete"
        # self.controller.login
    end

    def to_s
        a = self.username.split '.'
        if a.length <= 1
            "Last name: #{a[1..-1]}"
        elsif a.length == 2
            a.map(&:capitalize).join(' ')
        else 
            a.delete_at(1).map{ |n| n.capitalize }.join(' ')
        end
    end

end