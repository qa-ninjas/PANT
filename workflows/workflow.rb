require_relative "../pages_collection"
require_relative "../users/user"

class Workflow
  def initialize
    if self.class == Workflow
      puts "A workflow was specified that was not recognized"
    end
  end

  def setup  user:, hostname:, input:
    @input = input
    @controller = PagesCollection.new(hostname)
    @user = User.new(user[:username], user[:password], @controller)
  end

  def pre_run
    puts "settingup workflow for #{@user.to_s}..."
    ## not sure if we need this, standardized logging for begining a test?
  end

  def run
    puts "running workflow for #{@user.to_s}"
  end

  def post_run
    puts "Cleaning up run for #{@user}"
    @controller.tear_down
  end

end