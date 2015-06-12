
FactoryGirl.define do
  factory :image do
    sequence(:url) { |i| "http://a.url/url/#{i}" }
  end
end
