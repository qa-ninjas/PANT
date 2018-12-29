require "selenium-webdriver"

require_relative './login_page'
require_relative './sales_page'
require_relative './new_homes_page'

class PageBuilder
    # maybe this can be a module?
    # might not need anything besides ref to pages
    attr_reader :wait, :driver, :url

    def initialize hostname

        @url = "https://" + hostname
        @driver = Selenium::WebDriver.for :firefox
        @wait = Selenium::WebDriver::Wait.new(:timeout => 10)

        @params = {
            :url => @url,
            :driver => @driver,
            :wait => @wait
        }


        # @url = "https://" + hostname
        # @driver = Selenium::WebDriver.for :firefox
        # @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    end

    def login_page
        # working on the assumption that the page should know
        # the required URL.. maybe check as part of init?
        LoginPage.new @params #@url, @driver, @wait
    end

    def new_homes_page
        # should these be hard-coded, stored somewhere, or am I missing something?
        @params[:url] += "/home_owners/new"
        NewHomesPage.new @params
    end

    def estimate_appointment
        page = EstimateAppointment.new("\/estimate")
        page.start
    end

    def tear_down
        @driver.quit
    end
end