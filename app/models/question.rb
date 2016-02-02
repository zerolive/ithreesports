class Question < ActiveRecord::Base
	validates :title, presence: true
	validates :answer, presence: true
	validates :exam_id, presence: true

	belongs_to :exam
end
