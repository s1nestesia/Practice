FactoryBot.define do
  factory :post do
    association :user
    id {1}
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/1.png')) }
    description { FFaker::Lorem.sentence }

    trait(:with_invalid_image) do
      image{ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/2.txt')) }
    end

  end
end