FactoryBot.define do
  factory :alert do
    sender { 'test@yahoo.com' }
    message { 'some random string for testing' }
  end
end
