FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    password "password"
    sequence(:email) { |n| "johndoe#{n}@example.com"}
  end
end
