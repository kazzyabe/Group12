class QuizzesController < ApplicationController

  def edit
    @quiz = Quiz.find(params:[id])
  end

  def create
 @quiz = current_user.build_quiz(quiz_params)
    if @quiz.save
      flash[:success] = "Updated"
      redirect_to '/'
    else
      render 'new'
    end
  end

  def quiz_params
     params.require(:quiz).permit(:q1, :q2, :q3, :q4, :q5)
   end

   def show
   end

end
