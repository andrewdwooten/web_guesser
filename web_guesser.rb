require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(99)
get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:x => SECRET_NUMBER, :message => message}
  
end

def check_guess(guess)
  case 
    when guess.to_i > SECRET_NUMBER + 5
      "Way too high!!"
    when guess.to_i < SECRET_NUMBER - 5
      "Way too low!!"
    when guess.to_i > SECRET_NUMBER
      'Too high!!'
    when guess.to_i < SECRET_NUMBER
      "Too low!!"
    when guess.to_i == SECRET_NUMBER
      "You got it right!\n
        The SECRET NUMBER is #{SECRET_NUMBER}"
    end
end