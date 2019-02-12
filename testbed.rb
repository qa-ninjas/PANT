require 'selenium-webdriver'

require_relative './ruby-modules/csv_parser.rb'

csv = CSVParse.new("temp.csv", [1])
puts csv.csv_arr