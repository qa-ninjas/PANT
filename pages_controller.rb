require_relative './pages/login_page'
require_relative './pages/sales_page'

class PagesController 
    # maybe this can be a module?
    # might not need anything besides ref to pages
    attr_reader :wait, :driver, :host_name

    def initialize hostname
        @host_name = hostname
        @url = "https://" + hostname
       # @wait = 15
       #  @driver = "some selenium"
       # im going to do a sample with driver owned by the user
       # to see how it works
    end

    def login_page
        # working on the assumption that the page should know
        # the required URL.. maybe check as part of init?
        LoginPage.new
    end

    def estimate_appointment
        page = EstimateAppointment.new("\/estimate")
        page.start
    end

end