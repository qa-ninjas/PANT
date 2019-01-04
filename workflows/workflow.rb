require_relative "../users/user"

class Workflow
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

  # 
  #   get_input_json_data:       Gets input for a specific page from the 'data' folder. Any call to this method
  #                              **MUST** specify which sub-folder to use
  # 
  #   inputs:        filename        - Filename + sub-folder of the data we need. ie 'appointment-info/estimate.json'
  #
  #   returns:                         hash of the json file 
  #
  #   throws:        ArgumentError   - when file not found
  def get_input_json_data filename
    filename = Dir.pwd + "/data/" + filename
    raise ArgumentError, "#{filename} not a valid file" unless File.file? filename 
    JSON.parse(File.read(filename), :symbolize_names => true)
  end

end