require 'json'

class Page

    attr_accessor :url
    attr_reader :wait

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

    def click_button button_identifier
        button = @driver.find_element button_identifier
        button.click
    end

    # 
    #   scroll_by_index:     takes a scroll wheel and selects at the index in the selector
    # 
    #   inputs:        element        - Selenium element set to the scroll wheel
    #                  element_index  - index of the HTML element to select
    #
    #   throws:        ArgumentError  - when the element given is **not** a selector
    def scroll_by_index element, element_index
        begin
            option = Selenium::WebDriver::Support::Select.new( element )
            option.select_by :index, element_index
        rescue ArgumentError
            raise ArgumentError, "The #{element.tag_name} element is not a selector"
        end
    end

    # 
    #   scroll_by_value:     takes a scroll wheel and selects a given option in the selector
    # 
    #   inputs:        element        - Selenium element set to the scroll wheel
    #                  element_value  - Name of the item in the selector
    #
    #   throws:        ArgumentError  - when the element given is **not** a selector
    def scroll_by_value element, element_value
        begin
            option = Selenium::WebDriver::Support::Select.new( element )
            option.select_by :value, element_value
        rescue ArgumentError
            raise ArgumentError, "The #{element.tag_name} element is not a selector"
        end
    end

    #
    #   scroll_into_view:       Takes an element and displays it on-screen if said element would be not clickable
    #   inputs:                 element        - Selenium element that is out of view
    def scroll_into_view element
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
    #   inputs:        element         - hash {:how => "what"} the selector type and its value
    #
    #   returns:                         true if found false if not there
    def element_present? element
        @driver.find_elements(element).length > 0
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

# probably a good place for things like "elementExists?"" methods
# actions that youd want to perform on any page
# maybe even as broken down as .click(Element)
# not sure about that, need to learn selenium still
