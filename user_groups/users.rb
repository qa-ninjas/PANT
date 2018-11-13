require_relative "../pages_controller.rb"

module User

    def login
        puts "here"
        self.controller.login
    end

    def to_s
        a = self.username.split '.'
        if a.length <= 1
            "Last name: #{a[1..-1]}"
        elsif a.length == 2
            a.map(&:capitalize).join(' ')
        else 
            a.delete_at(1).map{ |n| n.capitalize }.join(' ')
        end
    end

end