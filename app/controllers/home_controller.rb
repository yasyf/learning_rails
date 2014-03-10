class HomeController < ApplicationController
  def index
  	redirect_to movies_path
  end
end
