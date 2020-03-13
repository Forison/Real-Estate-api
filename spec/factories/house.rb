FactoryBot.define do
  factory :house do
    name { 'MyString' }
    category { 'some category' }
    description { 'some category' }
    price { '12222222' }
    location { 'Ghana' }
    sequence(:user_id) { |n| n }
    pictures { ['/spec/support/assets/test.png'] }
  end
end
