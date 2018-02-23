require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'

require_relative 'models/speaker'

class ConferenceApp < Sinatra::Base
  set :database_file, 'config/database.yml'

  get '/' do
    'It Works!'
  end

  get '/hello.json' do
    message = { success: true, message: 'hello'}
    json message
  end

  get '/speakers' do
    @speakers = Speaker.all
    json @speakers
  end
end
