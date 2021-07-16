class RelationshipsController < ApplicationController
  def create
    other_user = User.find(params[:user_id])
    @rel = Relationship.create(follower_id: current_user.id,
                            followed_id: other_user.id)
    redirect_to user_path(other_user)
  end
end

def destroy
  @rel = Relationship.find(params[:id])
  @rel.destroy
  redirect_to user_path(@rel.followed.id)
end
