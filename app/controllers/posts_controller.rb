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
    @autolike_follows = Autolike.where(autolike_following_id: current_user.id)

    if @post.save
      redirect_to root_path
      if @autolike_follows.present?
        @autolike_follows.each do |auto_like|
          autolike_follower = auto_like.autolike_follower
          Like.create(user_id: autolike_follower.id, post_id: @post.id)
        end
      end
    else
      redirect_to root_path, flash: { error: "You can't create an post without attached image" }
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