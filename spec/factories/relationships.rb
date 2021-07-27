FactoryBot.define do
  factory :relationship do
    association :follower , class_name: "User"
      association :followed , class_name: "User"

  end
end