require_relative "./page.rb"

class NewHomesPage < Page

    # UI Mapping
    FIRST_NAME           = { :name => "first_name" }
    LAST_NAME            = { :name => "last_name"  }
    PHONE_NUMBER         = { :name => "number" }
    PHONE_NUMBER_TYPE    = { :name => "number_type" }
    OWNER_ADDRESS        = { :name => "address" }
    CALL_WAIVER          = { :css => "label.btn:nth-child(2)" }
    COLAPSE              = { :css => "button.collapse-person:nth-child(1)" }
    CSS_BUTTON           = { :css => "button.btn:nth-child(2)" }
    ZIPCODE              = { :name => "zip" }
    ADDRESS              = { :id => "searchable-address1" }
    SUBMIT_BUTTON        = { :xpath => "//button[@class='btn btn-primary pull-right']" }
    SECOND_HOMEOWNER_ADD = { :css => ".add-resident" }
    # I am sin I have no idea what this is
    UMMM_FORGOT          = { :css => "div.mb-3:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(8) > div:nth-child(1) > div:nth-child(1) > select:nth-child(2)" }

    def initialize url:, driver:, wait:
        super
        puts "navigating to new homeowner info page"
        navigate_to @url
    end

    # send_keys_to_element elem_identifier, string_to_send
    def add_homeowner homeowner, num
        driver = @driver
        wait   = @wait

        puts "adding homeowner #{ num + 1 }"
        if num == 1 then driver.find_element(SECOND_HOMEOWNER_ADD).click end

        # input the name
        driver.find_elements(FIRST_NAME)[num].send_keys homeowner[:first_name]
        driver.find_elements(LAST_NAME)[num].send_keys homeowner[:last_name]

        # phone number input
        driver.find_elements(PHONE_NUMBER)[num].send_keys homeowner[:phone_number]
        element = driver.find_elements(PHONE_NUMBER_TYPE)[num]
        option  = Selenium::WebDriver::Support::Select.new element   # this will be changed in a different PR
        # UI mapping not working here for whatever reason?
        option.select_by :value, "Home"

        # email
        driver.find_elements(OWNER_ADDRESS)[num].send_keys homeowner[:email]

        # waiver
        driver.find_elements(CALL_WAIVER)[num].click

        if num == 1
            element = driver.find_element(UMMM_FORGOT)
            option  = Selenium::WebDriver::Support::Select.new(element)
            # UI mapping not working here for whatever reason?
            option.select_by :index, 1
            driver.find_element(COLAPSE).click
            driver.find_element(CSS_BUTTON).click
            sleep 10
        end

    end

    def add_home_data zip, address
        puts "adding home data"
        send_keys_to_element ZIPCODE, zip
        send_keys_to_element ADDRESS, address
    end

    def submit_home
        puts "submitting the form"
        element = wait.until{ driver.find_element(SUBMIT_BUTTON) }
        element.click
    end

end