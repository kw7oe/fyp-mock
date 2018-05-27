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
  result = DataGenerator.construct_course(id: params[:id])
  JSON(result)
end

# Get attendance of a class
# E.g /attendance?course_id=1&date=2017-07-24&group_id=3
get '/attendance' do content_type :json
result = DataGenerator.construct_attendance(
    course_id: params[:course_id],
    date: params[:date],
    group_id: params[:group_id]
  )
  JSON(result)
end

