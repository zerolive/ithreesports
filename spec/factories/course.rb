require 'faker'

FactoryGirl.define do
  factory :course do
  	name Faker::Name.title
  	imageurl Faker::Internet.url
  	price Faker::Number.number(2)
  	description Faker::Lorem.characters(200)
  	videourl Faker::Internet.url
  	factory :course_with_exams do
      transient do
        exams_count 10
      end
      after(:create) do |course, evaluator|
        create_list(:exam, evaluator.exams_count, course: course)
      end
    end
  end
end