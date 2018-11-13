require_relative './pages/login_page'
require_relative './pages/sales_page'

class PagesController
    attr_reader :wait, :driver

    def initialize 
        @wait = 15
        @driver = "some selenium"
    end

    def login_page
        page = Login.new("\/login")
        page.start
    end

    def estimate_appointment
        page = EstimateAppointment.new("\/estimate")
        page.start
    end

end