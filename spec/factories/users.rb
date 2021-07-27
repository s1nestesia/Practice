require 'ffaker'

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
  factory :user1 , class: "User" do
    email { FFaker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
  factory :user2 , class: "User" do
    email { FFaker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end


end