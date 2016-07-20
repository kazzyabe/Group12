class WelcomeController < ApplicationController
  def index
  end

  def landing
    if current_user != nil
    if current_user.quiz.nil?
    @quiz = Quiz.new
  else
    @quiz = current_user.quiz(params[:id])
  end
else
end
  end

end
