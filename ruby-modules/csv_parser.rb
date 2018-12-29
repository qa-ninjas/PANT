# This class is used to work with a .csv file. It's verry specific for our use-cases, so
# it really isn't inteded for general use-cases (whatever those may be)
#
# Author::    andrew-k9 (mailto:lt.kvothe@gmail.com)

require 'csv'

class CSVParse

	attr_accessor :csv_arr, :columns

    #   inputs:        filename       - filename we're looking for
    #                  columns        - columns in the table that are of interest (used in `some_cols`)
    #
    #   throws:        ArgumentError  - when file is not found
    def initialize filename, columns
        
		filename = Dir.pwd + "/data/csv/" + filename
        raise ArgumentError, "csv not found" unless File.file? filename

        ans = []
        CSV.foreach(filename) { |line| ans << line }
        self.csv_arr = ans.to_a
        self.columns = columns.to_a
	end

	# Returns:
	#   array of row value arrays at some given number of columns
	def some_columns
		ans = []
		self.csv_arr.each do |row|
			redacted = []
			self.columns.each do |c|
				redacted << row[c]
			end
			ans << redacted
		end
		ans
	end

end