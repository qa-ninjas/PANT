require_relative "./page.rb"

class NewCorporateEventPage < Page
    # UI MAPPING
    NAME_FIELD =   { id: "corporate_event_name"}
    DESTINATION_FIELD =   { id: "corporate_event_destination"}
    VENUE_SELECT2 =   { id: "s2id_corporate_event_venue_id"}

    # DATE PICKERS
    REGISTRATION_START_DATE_PICKER =   { id: "corporate_event_registration_start_date"}
    REGISTRATION_END_DATE_PICKER =   { id: "corporate_event_registration_end_date"}
    UPDATES_UNTIL_DATE_PICKER =   { id: "corporate_event_updates_until"}
    SHOW_AT_DATE_PICKER =   { id: "corporate_event_show_at"}
    HIDE_AT_DATE_PICKER =   { id: "corporate_event_hide_at"}
    EVENT_START_DATE_PICKER =   { id: "corporate_event_event_start_date"}
    EVENT_END_DATE_PICKER =   { id: "corporate_event_event_end_date"}

    # MISC FIELDS
    TIME_ZONE_SELECT =   { id: "corporate_event_time_zone"}
    LEADING_SPACE_FIELD =   { id: "corporate_event_leading_space"}
    LEAD_COORDINATOR_SELECT =   { id: "corporate_event_lead_coordinatior_id"}
    ASSOCIATE_COORDIATORS_MULTISELECT =   { id: "corporate_event_associate_coordinator_ids_chosen"}
    PREVIEW_USERS_MULTISELECT =   { id: "corporate_event_preview_user_ids_chosen"}
    # NOMINATIOR_MULTISELECT =   { id: "NONE YET"} TODO - this one is different

    # CHECKBOXES FOR EVENT CONTROLS
    CHOOSE_ROOMATES_CHECKBOX =   { id: "corporate_event_attendees_can_choose_roommate"}
    ACTIVE_CHECKBOX =   { id: "corporate_event_active"}
    OPEN_SIGNUP_CHECKBOX =   { id: "corporate_event_open_signup"}
    REQUIRE_FLIGHT_INFO_CHECKBOX =   { id: "corporate_event_requires_flight_info"}

    # Connect Image
    BG_IMAGE_1X =   { id: "corporate_event_background_image"}
    BG_IMAGE_2X =   { id: "corporate_event_retina_background_image"}
    BG_IMAGE_3X =   { id: "corporate_event_retina_hd_background_image"}

    # Connect Color Controls
    TEXT_COLOR_INPUT =   { id: "corporate_event_text_color"}
    DIVIDER_COLOR_INPUT =   { id: "corporate_event_divider_color"}
    BACKGROUND_COLOR_INPUT =   { id: "corporate_event_background_color"}
    HIGHLIGHT_COLOR_INPUT =   { id: "corporate_event_highlight_color"}

    # Buttons at bottom
    SAVE_BUTTON = {class: "btn-primary"}
    CANCEL_BUTTON = {class: "btn-link"}
    

    # Builds the page for a new corporate event entry
    def initialize url:, driver:, wait:
        super
        @path = "/corporate_events/new"
        puts "navigating to New Corporate Event page if not here"
        navigate_to @url + @path
    end

    def build_event input
        puts input
        enter_event_name input[:event_name]
        enter_destination input[:destination]
        select_venue input[:venue]
        sleep 3
    end

    def enter_event_name name
        ##should we do validation here? or let the page fail and catch it there?
        send_keys_to_element(NAME_FIELD, name)
    end

    def enter_destination destination
        send_keys_to_element(DESTINATION_FIELD, destination)
    end

    def select_venue venue
        choose_from_select2(VENUE_SELECT2, venue)
    end

    def enter_registration_start_date date
       #stub 
    end 

    def enter_registration_end_date date

    end

    def enter_updates_until_date date

    end

    def enter_show_at_date date

    end

    def enter_hide_at_date date

    end

    def select_time_zone time_zone

    end

    def enter_leading_space leading_space
    end

    def select_lead_coordiation lead_coordinator
    end

    def select_associate_coordinators associate_coordinators
    end

    def select_preview_users preview_users
    end

    def select_nominators nominators 
        ## STUB FOR NOW
    end

    def enable_attendies_can_choose_checkbox
    end

    def enable_active_checkbox
    end

    def enable_open_signup_checkbox
    end

    def enable_requires_flight_info_checkbox
    end

    def upload_bg_images images 
    end

    def input_connect_colors text:, divider:, highlight:, background:

    end

    def save_event
    end

    def cancel_save
    end

end
