require_relative "./user"
require_relative "./corporate_event_permission"

module UserBuilder
    POSSIBLE_PERMISSIONS = [
        "CorporateEvent"
    ]

    ## Creates and returns a new user
    #
    #  Expects user_info to be in the following format:
    #  {
    #     :username: string,
    #     :password: string ,
    #     :permissions: [string, string, ...]
    #  }
    #
    def build_user_from_input(page_builder:, user_info:)
        user = User.new(username: user_info[:username], password: user_info[:password], page_builder: page_builder)
        add_permissions user, user_info[:permissions]


        # p "user_info:", user_info
        # p **user_info
        # PermissionedUser.new(**user_info, page_builder: page_builder)#username: user_info[:username], password: user_info[:password], controller:
        user
    end

    def add_permissions user, permissions
        permissions = [] unless permissions
        puts "adding #{permissions.count} to #{user}"
        permissions.each do |permission|
            
            ##this checks that the permission is one we expect
            # and if it does, dynamically includes it in the user
            if POSSIBLE_PERMISSIONS.include? permission
                user.class.send :include, Module.const_get(permission + "Permission")
            end
        end
        
    end


end
