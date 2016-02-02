require 'faker'

FactoryGirl.define do
  factory :question do
  	title Faker::Name.title
  	answer true
  	exam_id 1
  end
end