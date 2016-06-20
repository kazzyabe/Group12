class WelcomeController < ApplicationController
  before_action :current_user, only: [:index, :show]
  before_action :require_admin, only: [:destroy]

  def index
  end
end
