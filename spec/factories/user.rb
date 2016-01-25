require 'faker'

FactoryGirl.define do
  factory :user do
    name Faker::Lorem.characters(8)
    password Faker::Internet.password(8)
    level '1'
  end
end