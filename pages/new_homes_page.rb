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
        @url += "/home_owners/new"
        navigate_to @url
    end

    def create_new_home data
        #screen  = @user.page_builder.new_homes_page
        add_home_data data[:zip], data[:address]
        add_homeowner data[:owner_one], 0
        if data[:co_flag] then add_homeowner(data[:owner_two], 1) end
        submit_home
    end

    # send_keys_to_element elem_identifier, string_to_send
    def add_homeowner homeowner, num
        driver = @driver
        wait   = @wait

        puts "adding homeowner #{ num + 1 }"
        if num == 1 then click_button SECOND_HOMEOWNER_ADD end

        # input the name
        send_keys_to_array_element FIRST_NAME, homeowner[:first_name], num
        send_keys_to_array_element LAST_NAME, homeowner[:last_name], num

        # phone number input
        send_keys_to_array_element PHONE_NUMBER, homeowner[:phone_number], num
        scroll_by_value nil, "Home", driver.find_elements(PHONE_NUMBER_TYPE)[num]

        # email
        send_keys_to_array_element OWNER_ADDRESS, homeowner[:email], num

        # waiver
        click_button_at_position CALL_WAIVER, num

        if num == 1
            scroll_by_index UMMM_FORGOT, 1, nil
            click_button COLAPSE
            click_button CSS_BUTTON
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
        element = @wait.until{ @driver.find_element(SUBMIT_BUTTON) }
        puts "sleep my child"
        sleep 1000
        element.click
    end

end