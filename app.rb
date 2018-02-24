require 'pry'
require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'
require 'rack/contrib'

require_relative 'models/speaker'
require_relative 'graphql/schema'

class ConferenceApp < Sinatra::Base
  set :database_file, 'config/database.yml'
  use Rack::PostBodyContentTypeParser

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

  post '/graphql' do
    result = ConferenceAppSchema.execute(
      params[:query],
      variables: params[:variables],
      context: { current_user: nil },
    )
    json result
  end
end
