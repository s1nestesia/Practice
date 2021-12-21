class AutolikeFollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @autolike_folowers = @user.autolike_followers
  end
end