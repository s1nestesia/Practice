require 'rails_helper'


RSpec.describe PostsController, type: :controller do

  let(:user) { create :user }
  let(:params) {{ user_id: user }}

  before { sign_in user }

  describe "#create" do

    let(:params) do
      {
        user_id: user.id,
        post: attributes_for(:post)
      }
    end

    subject { post :create, params: params }

    it 'create post' do
      expect {subject}.to change{ Post.count }.by(1)
      is_expected.to redirect_to(root_path(assigns(:user), assigns(:post)))
    end

  end

  describe "#show" do
    let(:post) { create :post, user: user }
    let(:params) {{ user_id: user, id: post}}

    subject { get :show, params: params }

    it 'assigns post' do
      subject
      expect(assigns(:post)).to eq(post)
      expect(assigns(:comment)).to be_a_new Comment
    end

    it { is_expected.to render_template(:show) }

    end


  describe "#destroy" do
    let(:post) { create :post, user: user }
    let(:params) {{ user_id: user, id: post }}

    subject { process :destroy, method: :delete, params: params }

    it 'destroy post' do
      expect ( Post.count == 0 )
      is_expected.to redirect_to(user_path(user))
      expect(assigns(:post)).to eq(post)

      end
    end

end