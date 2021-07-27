require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe RelationshipsController, type: :controller do
  let(:current_user) { create :user } # user who likes a post (current_user)
  let(:user) { create :user2 }

  before {sign_in current_user}

  describe '#create' do

    let!(:params) do
      {
        user_id: user,
        follower_id: current_user.id,
        followed_id: user.id
      }
    end

    subject { post :create, params: params }

    it 'create follows' do
      expect { subject }.to change { Relationship.count }.by(1)
      is_expected.to redirect_to(user_path(user))

    end
  end

  describe '#destroy' do

    let!(:relationship) { create :relationship,
                                 follower: current_user,
                                 followed: user}

    let!(:params) do
      {
        id: relationship.id
      }
      end

    subject { process :destroy, method: :delete, params: params }

    it 'destroy follows' do
      relationship
      expect { subject }.to change { Relationship.count }.by(-1)
      expect(assigns(:rel)).to eq(relationship)

      is_expected.to redirect_to(user_path(user))
    end
  end


end


DatabaseCleaner.clean