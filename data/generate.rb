require 'json'

json = JSON.parse(File.read(ARGV[0]))

id = json["id"]

json["classes"].each do |d|
  group_id = d["group_id"]
  d["dates"].each do |o_date|
    date = o_date
    `touch "attedance_#{id}_#{date}_#{group_id}.json"`
  end
end
