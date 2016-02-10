require 'rails_helper'

RSpec.describe CompletedExam, type: :model do
	describe 'Serializers' do
	let(:completed_exam){build(:completed_exam)}

		it 'allow to have a hash in answers' do
			completed_exam.answers = { 1 => true}

			expect(completed_exam.save).to eq true
		end
	end

  describe 'Validations' do
  	let(:completed_exam){build(:completed_exam)}

  	it 'can create a new completed exam' do
  		expect(completed_exam.save).to eq true
  	end

  	it 'cannot create a new completed exam without exam id' do
  		completed_exam.user_id = nil
  		
  		expect(completed_exam.save).to eq false
  	end

  	it 'cannot create a new completed exam without answers' do
  		completed_exam.answers = nil
  		
  		expect(completed_exam.save).to eq false
  	end

  	it 'cannot create a new completed exam without score' do
  		completed_exam.score = nil
  		
  		expect(completed_exam.save).to eq false
  	end
  end

  describe 'Associations' do
  	it 'belongs to user' do
  		expect(CompletedExam.reflect_on_association(:user).macro).to eq(:belongs_to)
  	end
  end
end
