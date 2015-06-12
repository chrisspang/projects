
FactoryGirl.define do
  factory :builder do
    sequence(:name) { |i| "builder_#{i}" }
    sequence(:title) { |i| "Builder #{i}" }
  end
end
