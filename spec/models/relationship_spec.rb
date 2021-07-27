require 'rails_helper'

RSpec.describe Relationship, type: :model do

  it { is_expected.to belong_to(:follower).class_name("User") }
  it { is_expected.to belong_to(:followed).class_name("User") }

  it { is_expected.to validate_uniqueness_of(:follower_id).scoped_to(:followed_id)}

end