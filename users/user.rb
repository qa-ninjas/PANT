
class User
    # include page_collection do i need this? require/include..
    # i think i dont but lets see

    def initialize  username, password, pages_collection
        @username = username
        @password = password

        @collection = pages_collection
    end

    def login
        puts "user #{self.to_s} is trying to log into #{@collection.host_name}"
        login_page = @collection.login_page

        login_page.enter_username @username
        login_page.enter_password @password
        login_page.submit_form

        puts "login complete"
        # self.collection.login
    end

    def to_s
        a = @username.split '.'
        if a.length <= 1
            @username[0].upcase + ". " + @username[1..-1].capitalize
        elsif a.length == 2
            a.map(&:capitalize).join(' ')
        else 
            a.delete_at(1)
            a.map{ |n| n.capitalize }.join(' ')
        end
    end

end