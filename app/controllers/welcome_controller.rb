class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end

  def landing
  end
end
