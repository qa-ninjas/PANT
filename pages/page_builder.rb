require_relative './login_page'
require_relative './sales_page'
require_relative './new_corporate_event_page'
require "selenium-webdriver"

class PageBuilder
    # maybe this can be a module?
    # might not need anything besides ref to pages
    attr_reader :wait, :driver, :url

    def initialize hostname

        @url = "https://" + hostname
        @driver = Selenium::WebDriver.for :firefox
        @wait = Selenium::WebDriver::Wait.new(:timeout => 10)

        # This should be the same for all new pages
        # The page itself should know the /path of the URL
        @params = {
            :url => @url,
            :driver => @driver,
            :wait => @wait
        }
    end

    def login_page
        LoginPage.new @params #@url, @driver, @wait
    end

    def new_corporate_event_page
        NewCorporateEventPage.new @params
    end

    def tear_down
        @driver.quit
    end
end