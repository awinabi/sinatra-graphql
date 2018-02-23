require 'sinatra'

class ConferenceApp < Sinatra::Base

  get '/' do
    'It Works!'
  end
end
