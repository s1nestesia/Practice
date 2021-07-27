class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:create,:vote]
  before_action :show, only:[:show,:vote]
  respond_to :js, :json, :html
  def upvote
    @post = Post.find(params[:id])
    if current_user.voted_up_on? @post
      @post.unvote_by current_user
    else
      @post.upvote_by current_user
    end
    render "vote.js.erb"
  end



  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if user_signed_in?

    if @post.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end
end