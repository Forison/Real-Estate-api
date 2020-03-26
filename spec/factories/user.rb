FactoryBot.define do
  factory :user do
    username { 'Addo' }
    country { 'Ghana' }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { 'iammorethansix' }
    picture { '/spec/support/assets/test.png' }
  end
end
