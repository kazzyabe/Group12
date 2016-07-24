class AnswersController < ApplicationController

  def edit
    @answer = Answer.find(params:[id])
  end

  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      flash[:success] = "Updated"
      redirect_to '/'
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
    @answer = Answer.find(params[:id])
      if @answer.update(answer_params)
        format.html { redirect_to '/', notice: 'Answers were successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end


  def answer_params
     params.require(:answer).permit(:r1, :r2, :r3, :r4, :r5)
   end

   def show
     @answers = Answer.all
   end

end
