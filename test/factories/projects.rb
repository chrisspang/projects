
FactoryGirl.define do
  factory :project do
    sequence(:name) { |i| "fg_project_#{i}" }
    sequence(:title) { |i| "FG Project #{i}" }
    verified false
    sequence(:longitude) { |i| 70 + i }
    sequence(:latitude) { |i| 10 + i }

    factory :project_verified do
      verified true
    end

    association :builder
  end
end
