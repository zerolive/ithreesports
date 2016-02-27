require 'rails_helper'

RSpec.describe Answer, type: :model do
	describe 'Validations' do
		let(:new_answer){ build(:answer) }

		it 'cannot create an answer without question_id' do
			new_answer.question_id = nil

			expect(new_answer.save).to eq false
		end

		it 'cannot create an answer without title' do
			new_answer.title = nil

			expect(new_answer.save).to eq false
		end

		it 'cannot create an answer without fill the field right' do
			new_answer.right = nil

			expect(new_answer.save).to eq false
		end

		it 'cannot create an answer without fill the field right with true or false' do
			new_answer.right = 'anything'

			expect(new_answer.save).to eq false
		end

		it 'can create an answer filling field right with 0' do
			new_answer.right = '0'

			expect(new_answer.save).to eq true	
		end

		it 'can create an answer filling field right with 1' do
			new_answer.right = '1'
			
			expect(new_answer.save).to eq true	
		end
	end

	describe 'Associations' do
		it 'belongs to question' do
			expect(Answer.reflect_on_association(:question).macro).to eq(:belongs_to)
		end
	end
end
