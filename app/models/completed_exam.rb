class CompletedExam < ActiveRecord::Base

	validates :user_id, presence: true
	validates :questions, presence: true
	validates :score, presence: true
	validates :exam_id, presence: true

	belongs_to :user
end
