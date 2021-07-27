require 'ffaker'
FactoryBot.define do
  factory :comment do
    association :post
    association :user

    comment { FFaker::Lorem.sentence }

  end
end