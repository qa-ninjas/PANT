require 'json'
require "selenium-webdriver"
class Page

    attr_accessor :url
    attr_reader :wait

    def initialize url:, driver:, wait:
        @url = url
        @driver = driver
        @wait = wait
    end

    #   
    #   returns:       title of the page (Displayed in tab of page)
    def title
        @driver.title
    end

    ##  returns: current PATH of the URL "/homes/new"
    def current_path
        uri = URI @driver.current_url
        uri.path
    end

    ## Equivalent to typing in a new URL
    def navigate_to url
        @driver.get url
    end
 
    #   send_keys_to_element:     sends the given string to be typed to the element
    # 
    #   inputs:        element_identifier        - Hash for element's {:how => "what"}
    #                  string_to_send            - keys to be sent to element
    def send_keys_to_element element_identifier, string_to_send
        element = @driver.find_element(element_identifier)
        element.send_keys string_to_send
        #selenium will raise a Selenium::WebDriver::Error::NoSuchElementError if not found
    end

    #   click_button:              clicks a button
    # 
    #   inputs:        button_identifier        - Button to be clicked
    #
    def click_button button_identifier
        button = @wait.until{ @driver.find_element button_identifier }
        button.click
    end

    # 
    #   choose_from_select2_single:     Chooses the given choice from a select2 form
    # 
    #   inputs:        button_identifier        - Selenium element set to the scroll wheel
    #                  index                    - index of the HTML element to select
    #
    #   docs: https://select2.org/
    def choose_from_select2 select2_identifier, choice
        #Find and click the select2 element
        @driver.find_element(select2_identifier).click
        #Find and type into the input box, and entering the given choice
        @driver.find_element(id: "s2id_autogen1_search").send_keys choice
        #Find and click the first result after typing in given value
        @driver.find_element(css: "#select2-results-1 .select2-result-label").click 
    
    rescue Selenium::WebDriver::Error::NoSuchElementError
        puts "Couldn't find the given choice for #{select2_identifier}"
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
    #     !!! this may just be scrolling hte page to the bottom
    #           Serving its purpose now, but may need revisiting
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
    #   !!! This should likely be moved elsewhere, some type of helper for input-getting
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