FactoryBot.define do
  factory :notification do
    user { nil }
    notifyable { nil }
    read { false }
  end
end
