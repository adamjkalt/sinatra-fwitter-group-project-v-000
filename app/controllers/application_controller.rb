require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fwitter_secret"
 end

  get '/' do
      erb :index
    end

    helpers do

      def current_user
        @current_user ||= User.find_by_id(session[:user])
      end

      def logged_in?
        current_user != nil
      end

    end

end
