require_relative "./page.rb"

class NewCorporateEventPage < Page
    # UI MAPPING
    NAME_FIELD =   { id: "corporate_event_name"}
    DESTINATION_FIELD =   { id: "corporate_event_destination"}
    VENUE_SELECT =   { class: "select2-choice select2-default"}

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
        go_to @url + @path
    end


end