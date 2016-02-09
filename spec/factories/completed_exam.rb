require 'faker'

FactoryGirl.define do
  factory :completed_exam do
  	score 1
  	answers {{1 => true, 2 => false}}
  	user_id 1
  end
end