class WelcomeController < ApplicationController
  def index
  end

  def landing
    @quiz = Quiz.new
  end
end
