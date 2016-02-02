class Question < ActiveRecord::Base
	validates :title, presence: true
	validates :answer, inclusion: [true, false]
	validates :exam_id, presence: true

	belongs_to :exam
end
