class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = Like.where(user_id: current_user.id, post_id: params[:post_id])

    if @like.empty?
      Like.create(user_id: current_user.id, post_id: params[:post_id])
      redirect_to post_path(@post)
    else
      redirect_to @post, flash: { alert: 'Like is already there' }
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    Like.where(user_id: current_user.id, post_id: params[:post_id]).destroy_all
    redirect_to post_path(@post)
  end

end