class AnswersController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
  end
  def create
    @answer = current_question.answers.build(answer_params)
    @answer.user_id = @current_user.id
    @answer_msg=Answermsg.new
    @answer_msg.question_id = current_question.id
    @answer_msg.user_id = current_question.user_id
    @answer_msg.answer_user = current_user.id
    @answer_msg.read = false
    @answer_msg.save
    if @answer.save
        flash[:success] = "question created!"
        redirect_to  question_path(@answer.question_id) # 'questions/show'
    else
        redirect_to  question_path(@answer.question_id)
    end
  end


  def destroy
    Answer.find(params[:id]).destroy
    redirect_to current_question
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end

end