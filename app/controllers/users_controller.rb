class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  def new
    @user = User.new
  end
  def index
    @users = User.paginate(page: params[:page])
  end
  def show
    if $flag==1
      @invite = Invite.new
      @invite.invited_id = User.find(params[:id]).id
      @invite.invite_id = current_user.id
      @invite.question_id = $question_id
      @invite.save
      $flag=0
      redirect_to current_question
    else
    @user = User.find(params[:id])
    @questions = @user.questions.paginate(page: params[:page])
    @answers = @user.answers.paginate(page: params[:page])

    end

  end
  def edit

  end
  def update
    if @user.update_attributes(user_params_edit)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    #puts(params[:id])
    redirect_to users_url
  end
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def user_params_edit
    params.require(:user).permit(:name, :email, :introduction, :education, :work, :settlement, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
