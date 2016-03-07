require 'rails_helper'

RSpec.describe MediaFile, type: :model do
	describe "Validations" do
		let(:new_media){ create(:media_file) }

		it "can create a new media file" do
			expect(new_media.save).to eq true
		end

		it "cannot create a media file without url" do
			new_media.url = nil

			expect(new_media.save).to_not eq true
		end
	end

	describe "Associations" do
		it "belongs to course" do
			expect(Exam.reflect_on_association(:course).macro).to eq(:belongs_to)
		end
	end
end
