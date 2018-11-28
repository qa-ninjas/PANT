require_relative "../pages_collection"
require_relative "../users/user"

class Workflow
  def initialize
 
  end

  def setup  user:, input:
    @input = input
    @controller = PagesCollection.new("https://" + input[:hostname])
    @user = User.new(user[:username], user[:password], @controller)

  end
  def pre_run
    puts "settingup workflow for #{@user.to_s}..."
    ## not sure if we need this, standardized logging for begining a test?
  end

  def run
    puts "running workflow for #{@user.to_s}"
  end

end