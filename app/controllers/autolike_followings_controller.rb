class AutolikeFollowingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @autolike_folowers = @user.autolike_followings
  end
end