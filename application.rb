require 'sinatra/base'
require 'gschool_database_connection'

require './lib/country_list'
require 'rack-flash'


class Application < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV['RACK_ENV'])
    @messages_table = MessagesTable.new(GschoolDatabaseConnection::DatabaseConnection.establish(ENV['RACK_ENV']))
  end

  get '/' do
    erb :index

  end

  post '/' do
    name = params[:name]
    message = params[:message]
    flash[:message] = "Message from #{name} : #{message}"
    @messages_table.message_and_name(name, message)
    flash[:all] = @messages_table.retreive_name_and_message
    redirect '/'
  end

  get '/continents' do
    all_continents = CountryList.new.continents
    erb :continents, locals: { continents: all_continents }
  end

  get '/continents/:continent_name' do
    list_of_countries = CountryList.new.countries_for_continent(params[:continent_name])
    erb :countries, locals: { countries: list_of_countries, continent: params[:continent_name] }
  end

end