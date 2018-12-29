require_relative "./page.rb"

class NewHomesPage < Page

    def initialize url:, driver:, wait:
        super
        puts "navigating to new homeowner info page"
        navigate_to @url
    end

    def add_homeowner
        puts "adding H/O"
    end
end