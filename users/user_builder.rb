require_relative "./user"

module UserBuilder


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
        p "user_info:", user_info
        User.new(**user_info, page_builder: page_builder)#username: user_info[:username], password: user_info[:password], controller:
    end



end
