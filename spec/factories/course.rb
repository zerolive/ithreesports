require 'faker'

FactoryGirl.define do
  factory :course do
  	name Faker::Name.title
  	imageurl Faker::Internet.url
  	price Faker::Number.number(2)
  	description Faker::Lorem.characters(200)
  	videourl Faker::Internet.url
  end
end