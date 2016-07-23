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

  def update
    respond_to do |format|
    @quiz = Quiz.find(params[:id])
      if @quiz.update(quiz_params)
        format.html { redirect_to '/', notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end


  def quiz_params
     params.require(:quiz).permit(:q1, :q2, :q3, :q4, :q5)
   end

   def show
     @quizzes = Quiz.all
   end

end
