require_relative "./user_groups/sales_user_group.rb"

RC = RemodelingConsultant.new("andrew.kloecker","LibertyBell")
puts "Logging in as #{RC.to_s}"
RC.login
RC.estimate_appointment