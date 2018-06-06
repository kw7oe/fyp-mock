require 'sinatra'
require 'json'
require_relative 'data_generator'

# Test
get '/' do
  content_type :json
  JSON({hello: "world"})
end

# Get courses class details
get '/courses/:id' do
  content_type :json
  result = DataGenerator.construct_course(params[:id])
  JSON(result)
end

get '/courses/:id/students' do
  content_type :json
  filename = "data/students_#{params[:id]}.json"
  if File.exist? filename
    return File.read(filename)
  end

  result = DataGenerator.generate_students(params[:id])
  File.open(filename, "w") do |f|
    f.write(JSON.pretty_generate(result))
  end
  JSON(result)
end

# Get attendance of a class
# E.g /attendance?course_id=1&date=2017-07-24&group_id=3
get '/attendance' do content_type :json
result = DataGenerator.construct_attendance(
    params[:course_id],
    params[:date],
    params[:group_id]
  )
  JSON(result)
end

