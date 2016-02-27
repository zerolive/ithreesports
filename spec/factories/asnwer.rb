require 'faker'

FactoryGirl.define do
  factory :answer do
  	question_id 1
  	title Faker::Name.title
  	right '1'
  end
end