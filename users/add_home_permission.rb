module AddHomePermission

    def add_home input , data
        puts "Adding a home..."
        homes_page  = @page_builder.new_homes_page
        @current_page = homes_page

        homes_page.create_new_home input, data
    end

end