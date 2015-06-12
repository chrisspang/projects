
FactoryGirl.define do
  factory :datasource do
    sequence(:name) { |i| "datasource_#{i}" }
    sequence(:title) { |i| "Datasource #{i}" }
  end
end
