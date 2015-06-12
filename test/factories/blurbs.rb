
FactoryGirl.define do
  factory :blurb do
    sequence(:description) { |i| "blurb blurb blurb #{i}" }

    association :project
  end
end
