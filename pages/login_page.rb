require_relative "./pages.rb"

# would deal with anny assertions, logging, etc
class Login < Pages
    def start
        puts "URL: #{@url}"
        puts "Logging in"
    end
end