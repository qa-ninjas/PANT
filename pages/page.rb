require 'json'

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

    def current_path
        uri = URI @driver.current_url
        uri.path
    end

    def navigate_to url
        @driver.get url
    end


    def send_keys_to_element element_identifier, string_to_send
        element = @driver.find_element(element_identifier)
        element.send_keys string_to_send
        #selenium will raise a Selenium::WebDriver::Error::NoSuchElementError if not found
    end

    # a lot of the buttons require a wait clause to work. Should this be a separate method called "click_button_with_wait" ? 
    # Thiw could also be simplified to one line in regular 
    def click_button button_identifier
        button = @wait.until{ @driver.find_element button_identifier }
        button.click
    end

    # 
    #   click_button_at_position:     clicks a button at the nth element of an array of buttons
    # 
    #   inputs:        button_identifier        - Selenium element set to the scroll wheel
    #                  index                    - index of the HTML element to select
    def click_button_at_position button_identifier, index
        button = @wait.until{ @driver.find_elements(button_identifier)[index] }
        button.click
    end

    # 
    #   scroll_by_index:     takes a scroll wheel and selects at the index in the selector
    # 
    #   inputs:        element_identifier   - Hash for element's {:how => "what"}
    #                  element_index        - index of the HTML element to select
    #
    #   throws:        ArgumentError  - when the element given is **not** a selector
    def scroll_by_index element_identifier, element_index
        begin
            element = @wait.until{ @driver.find_element element_identifier }
            option = Selenium::WebDriver::Support::Select.new( element )
            option.select_by :index, element_index
        rescue ArgumentError
            raise ArgumentError, "The #{element.tag_name} element is not a selector"
        end
    end

    # 
    #   scroll_by_value:     takes a scroll wheel and selects a given option in the selector
    # 
    #   inputs:        element_identifier   - Hash for element's {:how => "what"}
    #                  element_value        - Name of the item in the selector
    #
    #   throws:        ArgumentError  - when the element given is **not** a selector
    def scroll_by_value element_identifier, element_value
        begin
            element = @wait.until{ @driver.find_element element_identifier }
            option = Selenium::WebDriver::Support::Select.new( element )
            option.select_by :value, element_value
        rescue ArgumentError
            raise ArgumentError, "The #{element.tag_name} element is not a selector"
        end
    end

    #
    #   scroll_into_view:       Takes an element and displays it on-screen if said element would be not clickable
    #   inputs:                 element_identifier        - Hash for element's {:how => "what"}
    def scroll_into_view element_identifier
        element = @driver.find_element element_identifier
        @driver.execute_script "window.scrollBy(0,document.body.scrollHeight)", element
    end

    # 
    #   get_input_json_data:       Gets input for a specific page from the 'data' folder. Any call to this method
    #                              **MUST** specify which sub-folder to use
    # 
    #   inputs:        filename        - Filename + sub-folder of the data we need. ie 'appointment-info/estimate.json'
    #
    #   returns:                         hash of the json file 
    #
    #   throws:        ArgumentError   - when file not found
    def get_input_json_data filename
        filename = Dir.pwd + "/data/" + filename
        raise ArgumentError, "#{filename} not a valid file" unless File.file? filename 
        JSON.parse(File.read(filename), :symbolize_names => true)
    end

    # 
    #   element_present:       checks the page to see if an element exists.
    # 
    #   inputs:    element_identifier  - hash {:how => "what"} the selector type and its value
    #
    #   returns:                         true if found false if not there
    def element_present? element_identifier
        @driver.find_elements(element_identifier).length > 0
    end

    # 
    #   check_if_uncheck:       checks a checkbox if currently unchecked
    # 
    #   inputs:        element_object    - hash {:how => "what"} the selector type and its value
    def check_if_unchecked element_object
        element = @driver.find_element element_object
		if ! element.attribute("checked") then element.click end
	end

end