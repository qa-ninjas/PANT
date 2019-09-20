
require_relative "./workflow.rb"

class CreateCorporateEvent < Workflow

    def run
        super
        @user.login @page_builder

        puts "Creating event..."
        corp_event_page = @page_builder.new_corporate_event_page
        @current_page = corp_event_page 

        corp_event_page.build_event @input   
    end
end