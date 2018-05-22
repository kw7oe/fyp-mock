require 'sinatra'
require 'json'

get '/' do
  content_type :json
  JSON({apple: "cat"})
end
