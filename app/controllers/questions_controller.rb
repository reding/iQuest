class QuestionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  def index
    @query = Question.search do
      fulltext params[:search]
    end
    @questions = @query.results
    #redirect_to root_url
    render 'questions/_search'
  end
  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "question created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  def destroy
    Question.find(params[:id]).destroy
    redirect_to current_user
  end
  def show
    @question = Question.find(params[:id])
    $question_id = @question.id
    @answer = current_question.answers.build
    @answers = @question.answers
  end
  def add_approve
    @pre_approve=Qapprove.find_by(question_id:$question_id, user_id:current_user.id)
    if @pre_approve == nil
    @q_approve=Qapprove.new
    @q_approve.question_id = $question_id
    @q_approve.user_id = current_user.id
    @q_approve.save
    @question = Question.find($question_id)
    @approve_num = @question.approve + 1
    @question.update_attributes(approve:@approve_num)
      redirect_to current_question
    else
      @question = Question.find($question_id)
      @approve_num = @question.approve - 1
      @question.update_attributes(approve:@approve_num)
      @pre_approve.destroy
      redirect_to current_question
    end

  end

  private
  def question_params
    params.require(:question).permit(:title,:content)
  end
  def correct_user
    @question = current_user.questions.find_by(id: params[:id])
    redirect_to root_url if @question.nil?
  end
end