class InvitesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  def index
    @invites = Invite.where(:invited_id => current_user.id).order("id DESC")
    @invites.each do |invite|
      invite.read=1
      invite.save
    end
    @answer_msgs = Answermsg.where(:user_id=>current_user.id).order("id DESC")
    @answer_msgs.each do |answer_msg|
      answer_msg.read=1
      answer_msg.save
    end
  end
  def create

  end
  def destroy

  end
  def test
  end
  def show
    @qeed_items = User.paginate(page: params[:page], :per_page => 10)
  end

  private
  def invite_params
    params.require(:invite).permit(invited_id: @user.id)
  end


end