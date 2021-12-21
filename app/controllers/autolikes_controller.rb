class AutolikesController < ApplicationController
  before_action :authenticate_user!

  def create
    autolike_follower_user = current_user
    autolike_following_user = User.find(params[:user_id])

    Autolike.create(autolike_follower: autolike_follower_user, autolike_following: autolike_following_user)

    redirect_to user_path(autolike_following_user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @autolike_follow = Autolike.find_by(autolike_following_id: @user.id, autolike_follower_id: current_user.id).id
    Autolike.destroy(@autolike_follow)

    redirect_to user_path(@user)
  end
end