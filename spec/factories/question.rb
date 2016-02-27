require 'faker'

FactoryGirl.define do
  factory :question do
  	title Faker::Name.title
  	exam_id 1
    factory :question_with_answers do
      transient do
        answers_count 10
      end
      after(:create) do |question, evaluator|
        create_list(:answer, evaluator.answers_count, question: question)
      end
    end
  end
end