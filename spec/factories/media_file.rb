require 'faker'

FactoryGirl.define do
  factory :media_file do
  	course_id 1
  	url Faker::Internet.url
  	video "0"
  end
end