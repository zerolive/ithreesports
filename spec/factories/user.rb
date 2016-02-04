require 'faker'

FactoryGirl.define do
  factory :user, class: User do
    name Faker::Lorem.characters(8)
    password Faker::Internet.password(8)
    level '1'
  end
end

FactoryGirl.define do
  factory :admin, class: User do
    name Faker::Lorem.characters(8)
    password Faker::Internet.password(8)
    level 'Admin'
  end
end