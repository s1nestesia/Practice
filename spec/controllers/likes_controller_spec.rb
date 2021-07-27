require 'rails_helper'


RSpec.describe LikesController, type: :controller do

  let(:current_user) { create :user }
  before { sign_in current_user }

  let(:post1) { create :post }
  let(:user1) { User.find( post1.user_id ) }

  let(:params) do
    {
      post_id: post1,
      user_id: user1
    }
  end

  describe "#create" do
    subject { post :create, params: params }

    it 'add to database' do
      expect {subject}.to change { Like.count }.by(1)
      expect(assigns(:post)).to eq(post1)
      expect(assigns(:like)).not_to eq(nil)
    end

    it 'user likes post' do
      is_expected.to redirect_to(post_path(assigns(:post)))
    end
  end

  describe "#destroy" do
    let(:like) { create :like, user: current_user, post: post1 }
    let(:params) do
      {
        post_id: post1.id,
        user_id: user1.id,
        id: like.id
      }
    end

    subject { process :destroy, method: :delete, params: params }

    it 'delete like' do
      subject
      expect(assigns(:post)).to eq(post1)
      expect (Like.count == 0)
      is_expected.to redirect_to(post_path(assigns(:post)))
    end
  end

end