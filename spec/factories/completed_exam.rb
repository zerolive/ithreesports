require 'faker'

FactoryGirl.define do
  factory :completed_exam do
  	score 1
  	answers 1
  	user_id 1
  	exam_id 1
  end
end