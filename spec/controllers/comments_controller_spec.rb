require 'rails_helper'


RSpec.describe CommentsController, type: :controller do

  let(:current_user) { create :user }
  before { sign_in current_user }

  let(:post1) { create :post }

  let(:params) do
    {
      comment: attributes_for(:comment, post_id: post1 ,
                              user_id: current_user,)
    }
  end

  describe "#create" do
    subject { post :create, params: params }

    it 'add to database' do
      expect {subject}.to change { Comment.count }.by(1)
      end

    end
  end

