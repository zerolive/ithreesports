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

  		it 'cannot create an exam with level User' do
  			new_exam.level = 'User'
  			
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
    it 'belongs to course' do
      expect(Exam.reflect_on_association(:course).macro).to eq(:belongs_to)
    end
  end

  describe "Methods" do
    it 'knows its levels' do
      levels = Exam.levels

      expect(levels).to eq [ 'User', 'Admin' ]
    end

    it 'knows extrac an id from youtube video' do
      sort_url = build(:exam, video: 'https://youtu.be/l8PQVZBR4w0?t=9s')
      long_url = build(:exam, video: 'https://www.youtube.com/watch?v=hpFZWeQq_EU')

      expect(sort_url.video_id).to eq 'l8PQVZBR4w0'
      expect(long_url.video_id).to eq 'hpFZWeQq_EU'
    end
  end
end
