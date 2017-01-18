require 'sinatra'
require 'sinatra/reloader'

x = rand(99)
get '/' do
  "The SECRET NUMBER is #{x}"
end