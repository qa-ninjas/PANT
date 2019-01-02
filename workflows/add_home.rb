require_relative "./workflow.rb"

# 
#   AddHome: Workflow class that adds a home into our system.
#
#            Right now, I wasn't too sure how to get the page_builder working
#            without making it read accessable from the user class.
class AddHome < Workflow
    
    def initialize 
        super
    end

    # going to get away from the hardcoded aspect once the other PR hits
    def run
        data = JSON.parse(File.read(Dir.pwd + "/data/homeowner_info.json"), :symbolize_names => true)
        @user.login

        screen  = @user.page_builder.new_homes_page
        screen.add_home_data data[:zip], data[:address]
        screen.add_homeowner data[:owner_one], 0
        if data[:co_flag] then screen.add_homeowner(data[:owner_two], 1) end
        screen.submit_home
    end

    def post_run
        sleep 3
        puts "Add home post run"
        super
    end

end