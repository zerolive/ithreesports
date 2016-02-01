require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'Validations' do
  	let(:new_question){ build(:question) }

	it 'can create a new question' do
		expect(new_question.save).to eq true
	end

	it 'cannot create a new question without title' do
		new_question.title = nil

		expect(new_question.save).to_not eq true
	end

	it 'cannot create a new question without asnwer' do
		new_question.answer = nil

		expect(new_question.save).to_not eq true
	end
  end

  describe 'Associations' do
      it 'must belongs to exam' do
        	expect(Question.reflect_on_association(:exam).macro).to eq(:belongs_to)
      end

      it 'can access to its question' do
        exam = create(:exam_with_questions)
        question = exam.questions.first

        expect(question.exam_id).to eq exam.id
      end
  end
end
