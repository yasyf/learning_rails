class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'themoviedb'
  Tmdb::Api.key("5e0ef5dc844ab23f8182b046db3eebb2")
end
