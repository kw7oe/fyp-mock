require 'csv'
require 'json'

json = JSON.parse(File.read(ARGV[0]))

CSV.open(ARGV[0].sub(".json", ".csv"), "w") do |csv|
  csv << ["header"]
  json["students"].each { |s| csv << s }
end

