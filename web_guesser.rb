require 'sinatra'
require 'sinatra/reloader'

x = rand(99)
get '/' do
  erb :index, :locals => {:x => x}
end