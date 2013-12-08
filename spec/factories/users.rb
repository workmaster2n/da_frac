# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :email do
    |n| "person_#{n}@email.com"
    end
    password "password"

  end


  factory :admin, parent: :user do
    after(:create) do |user|
      user.add_role(:admin)
    end
  end
end
