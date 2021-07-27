require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build (:user) }

  it { is_expected.to have_many(:posts).dependent(:destroy) }
  it { is_expected.to have_many(:likes).dependent(:destroy) }

  it {is_expected.to have_many(:followers).with_foreign_key(:followed_id).class_name('Relationship')}
  it {is_expected.to have_many(:following).with_foreign_key(:follower_id).class_name('Relationship')}

  it { is_expected.to have_one_attached(:avatar) }

end