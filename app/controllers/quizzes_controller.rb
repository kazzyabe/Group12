class QuizzesController < ApplicationController


def create
  debugger
@quiz = Quiz.new(quiz_params)
if @quiz.save
flash[:success] = "Updated"
redirect_to @quiz
else
render 'new'
end
end

  def quiz_params
     params.require(:quiz).permit(:q1)
   end

   def show
   end

end
