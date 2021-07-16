class CommentsController < ApplicationController
  before_action :authenticate_user!, only:[:create,:vote]
  before_action :show, only:[:show,:vote]
  respond_to :js, :json, :html

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@comment.post.id)
      else
        redirect_to root_path
      end
    end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end