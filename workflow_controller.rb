require_relative "./workflows/login"
require_relative "./workflows/"

module WorkflowController









    def login input
        return Login.new(input)
    end

end
