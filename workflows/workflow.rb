require_relative "../users/user"

class Workflow
  attr_reader :user
  def initialize
    if self.class == Workflow
      puts "A workflow was specified that was not recognized"
    end
  end

  def setup  user:, input:
    @input = input
    @user = user
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
    ##may need to logout here, or do a check to determine if same user for next test?
  end

end