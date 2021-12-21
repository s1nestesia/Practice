class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]



  def show
    @user  = User.find(params[:id])
    @rel = @user.followers.find_by(follower: current_user)
    @posts = @user.posts.order(created_at: :desc)
    @autolikes = Autolike.find_by(autolike_following_id: @user.id, autolike_follower_id: current_user.id)
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :website,
                                 :bio, :email, :phone, :gender, :avatar)
  end
end