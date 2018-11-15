require_relative "./page.rb"

# would deal with anny assertions, logging, etc
class EstimateAppointment < Page
    def initialize url, driver
        super
    end


    def start
        puts "URL: #{@url}"
        puts "selling something"
    end
end