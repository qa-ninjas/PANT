class Page
    attr_accessor :url
    def initialize url, driver
        @url = url
        @driver = driver
    end
end

# probably a good place for things like "elementExists?"" methods
# actions that youd want to perform on any page
# maybe even as broken down as .click(Element)
# not sure about that, need to learn selenium still