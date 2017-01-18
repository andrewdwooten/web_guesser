require 'sinatra'
require 'sinatra/reloader'

@@guess_count = 0
@@x = rand(100)
get '/' do
  guess = params["guess"]
  message = check_guess(guess,@@x)
  erb :index, :locals => {:x => @@x, :message => message}
  
end

def check_guess(guess,x)
  case 
    when guess.to_i > x + 5 && @@guess_count <= 5
      @@guess_count += 1; "Way too high!!"
    when guess.to_i < x - 5 && @@guess_count <= 5
      @@guess_count += 1; "Way too low!!"
    when guess.to_i > x && @@guess_count <= 5
      @@guess_count += 1; 'Too high!!' 
    when guess.to_i < x && @@guess_count <= 5
      @@guess_count += 1;   "Too low!!"
    when guess.to_i == x && @@guess_count <= 5
      "You got it right!\n
        The SECRET NUMBER is #{x}"
    when @@guess_count > 5
      @@guess_count = 0; @@x = rand(100); 'New Secret Number!!'
    end
end