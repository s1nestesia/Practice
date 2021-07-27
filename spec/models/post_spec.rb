require 'rails_helper'

RSpec.describe Post, type: :model do

  it { is_expected.to have_one_attached(:image) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:likes) }
  it { is_expected.to validate_presence_of(:image)}

end