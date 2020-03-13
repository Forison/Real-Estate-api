FactoryBot.define do
  factory :userdo
    username { 'addo' }
    country { 'kofi' }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { 'ammorethansix' }
    trait :with_avatar do
      avatar { Rack::Test::UploadedFile.new(Rails.root.to_s + '/spec/support/assets/test.jpg', 'img/jpg') }
    end
  end
end