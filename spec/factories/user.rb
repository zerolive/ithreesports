require 'faker'

FactoryGirl.define do
  factory :user, class: User do
    sequence(:email) { |n| "admin#{n}@admin.com" }
    name Faker::Lorem.characters(8)
    password_digest Faker::Internet.password(8)
    level '1'
  end
end

FactoryGirl.define do
  factory :admin, class: User do
    sequence(:email) { |n| "user#{n}@user.com" }
    name Faker::Lorem.characters(8)
    password_digest Faker::Internet.password(8)
    level 'Admin'
  end
end