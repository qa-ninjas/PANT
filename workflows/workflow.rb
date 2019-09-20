require_relative "../users/user"

class Workflow
  def initialize
    if self.class == Workflow
      puts "A workflow was specified that was not recognized"
    end
  end

  def setup  user:, input:, page_builder:
    @input = input
    if user
      @user = User.new(username: user[:username], password: user[:password])
    end

    @page_builder = page_builder
  end


  ### same as setup, choose one or the other?? Keep both??
  def pre_run
    puts "settingup workflow for #{@user.to_s}..."
    ## not sure if we need this, standardized logging for begining a test?
  end

  def run
    puts "running workflow for #{@user.to_s}"
  end

  def post_run
    puts "Cleaning up run for #{@user}"
    ##may need to logout here, or do a check to determine if same user for next test?
  end

end