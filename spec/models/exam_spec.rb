require 'rails_helper'

RSpec.describe Exam, type: :model do
  describe 'Validations' do
  		let(:new_exam){ build(:exam) }

  		it 'can create an exam' do
  			expect(new_exam.save).to eq true
  		end

  		it 'cannot create an exam without title' do
  			new_exam.title = nil

  			expect(new_exam.save).to_not eq true
  		end

  		it 'cannot create an exam without level' do
  			new_exam.level = nil
  			
  			expect(new_exam.save).to_not eq true
  		end

  		it 'cannot create an exam with any level' do
  			new_exam.level = 'AnyLevel'
  			
  			expect(new_exam.save).to_not eq true
  		end

  		it 'cannot create an exam with level 1' do
  			new_exam.level = '1'
  			
  			expect(new_exam.save).to eq true
  		end

  		it 'cannot create an exam with level 2' do
  			new_exam.level = '2'
  			
  			expect(new_exam.save).to eq true
  		end

  		it 'cannot create an exam with level 3' do
  			new_exam.level = '3'
  			
  			expect(new_exam.save).to eq true
  		end
  end

  describe "Associations" do

    it 'can have many questions' do
      expect(Exam.reflect_on_association(:questions).macro).to eq(:has_many)
    end

    it 'can access to its questions' do
      exam_with_questions = create(:exam_with_questions)

      expect(exam_with_questions.questions.count).to eq 10
    end
  end
end
