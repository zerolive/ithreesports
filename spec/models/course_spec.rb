require 'rails_helper'

RSpec.describe Course, type: :model do
	describe "Validations" do
		let(:new_course){ build(:course) }
		it "can create a course" do
			expect(new_course.save).to eq true
		end

		it "cannot create a course without name" do
			new_course.name = nil

			expect(new_course.save).to_not eq true
		end
		it "cannot create a course without price" do
			new_course.price = nil

			expect(new_course.save).to_not eq true
		end
		it "cannot create two courses with same price" do
			old_course = create(:course)
			new_course.price = old_course.price

			expect(new_course.save).to_not eq true
		end
	end
	describe "Associations" do
		it 'has many exams' do
			expect(Course.reflect_on_association(:exam).macro).to eq(:has_many)
		end
		it 'has many media files' do
			expect(Course.reflect_on_association(:media_file).macro).to eq(:has_many)
		end
	end
end
