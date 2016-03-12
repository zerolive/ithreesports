require 'faker'

FactoryGirl.define do
  factory :media_file do
  	name Faker::Name.title
  	course_id 1
  	url Faker::Internet.url
  	video "0"
  end
end