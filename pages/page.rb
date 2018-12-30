class Page
    
    attr_reader :url, :driver, :wait

    def initialize url:, driver:, wait:
        @url = url
        @driver = driver
        @wait = wait
    end

    def title
        @driver.title
    end

    def current_path
        uri = URI @driver.current_url
        uri.path
    end

    def navigate_to url
        @driver.get url
    end


    def send_keys_to_element elem_identifier, string_to_send
        elem = @driver.find_element(elem_identifier)
        elem.send_keys string_to_send
        #selenium will raise a Selenium::WebDriver::Error::NoSuchElementError if not found
    end

    # a lot of the buttons require a wait clause to work. Should this be a separate method called "click_button_with_wait" ? 
    # Thiw could also be simplified to one line in regular 
    def click_button button_identifier
        button = @driver.find_element button_identifier
        button.click
    end

end

# probably a good place for things like "elementExists?"" methods
# actions that youd want to perform on any page
# maybe even as broken down as .click(Element)
# not sure about that, need to learn selenium still
