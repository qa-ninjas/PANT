require_relative './pages/login_page'
require_relative './pages/sales_page'

class PagesCollection
    # maybe this can be a module?
    # might not need anything besides ref to pages
    attr_reader :wait, :driver, :host_name

    def initialize hostname
        @host_name = hostname
        @url = "https://" + hostname
        @driver = "selenium driver"
    end

    def login_page
        # working on the assumption that the page should know
        # the required URL.. maybe check as part of init?
        LoginPage.new @url, @driver
    end

    def estimate_appointment
        page = EstimateAppointment.new("\/estimate")
        page.start
    end

end