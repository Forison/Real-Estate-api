FactoryBot.define do
  factory :user do
    username { 'addo' }
    country { 'kofi' }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { 'iammorethansix' }
    picture { '/spec/support/assets/test.png' }
  end
end
