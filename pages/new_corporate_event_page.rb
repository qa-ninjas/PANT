require_relative "./page.rb"

class NewCorporateEventPage < Page
    # Builds the page for a new corporate event entry
    def initialize url:, driver:, wait:
        super
        @path = "/corporate_events/new"
        puts "navigating to New Corporate Event page if not here"
        @driver.get @url + @path
    end
end