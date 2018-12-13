
require_relative "./workflow.rb"

class CreateCorporateEvent

    def run
        super
        @user.login

        @user.create_event @input

        
    end






end