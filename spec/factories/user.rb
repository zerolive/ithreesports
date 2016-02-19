require 'faker'

FactoryGirl.define do
  factory :user, class: User do
    email Faker::Internet.email
    name Faker::Lorem.characters(8)
    password_digest Faker::Internet.password(8)
    level '1'
  end
end

FactoryGirl.define do
  factory :admin, class: User do
    email Faker::Internet.email
    name Faker::Lorem.characters(8)
    password_digest Faker::Internet.password(8)
    level 'Admin'
  end
end