require 'sinatra'
require 'json'

# Test
get '/' do
  content_type :json
  JSON({hello: "world"})
end

# Get courses class details
get '/courses/:id' do
  content_type :json
  result = construct_course(id: params[:id])
  JSON(result)
end

# Get attendance of a class
# E.g /attendance?course_id=1&date=2017-07-24&group_id=3
get '/attendance' do
  content_type :json
  result = construct_attendance(
    course_id: params[:course_id],
    date: params[:date],
    group_id: params[:group_id]
  )
  JSON(result)
end

# Helper
def construct_course(id:)
  {
    id: id,
    dates: [
      {
        date: '2017-07-24',
        group_id: 1
      },
      {
        date: '2017-07-12',
        group_id: 2
      },
    ]
  }
end

def construct_attendance(course_id:, date:, group_id:)
  {
    course_id: course_id,
    date: date,
    group_id: group_id,
    attended: [
      15053648,
      15032412,
      15023412
    ],
    excuse: [
    ],
    absent: [
      14023122,
      13021321
    ]
  }
end
