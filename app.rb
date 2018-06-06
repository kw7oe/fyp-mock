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
  result = DataGenerator.generate_students(params[:id])
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

