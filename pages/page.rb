class Page
    attr_accessor :url
    def initialize url:, driver:, wait:
        @url = url
        @driver = driver
        @wait = wait
    end

    def title
        @driver.title
    end

    def send_keys_to_element elem_identifier, string_to_send
        elem = @driver.find_element(elem_identifier)
        elem.send_keys string_to_send
        #selenium will raise a Selenium::WebDriver::Error::NoSuchElementError if not found
    end

    def click_button button_identifier
        button = @driver.find_element button_identifier
        button.click
    end
end

# probably a good place for things like "elementExists?"" methods
# actions that youd want to perform on any page
# maybe even as broken down as .click(Element)
# not sure about that, need to learn selenium still