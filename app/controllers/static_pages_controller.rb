class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @question = current_user.questions.build
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 10)
    end
  end

  def help
  end

  def about
  end
end
