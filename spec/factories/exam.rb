require 'faker'

FactoryGirl.define do
  factory :exam do
    title Faker::Name.title
    position Faker::Number.number(1)
    video Faker::Internet.url
    comment Faker::Lorem.characters(200)
    level '1'
    factory :exam_with_questions do
      transient do
        questions_count 10
      end
      after(:create) do |exam, evaluator|
        create_list(:question, evaluator.questions_count, exam: exam)
      end
    end
  end
end