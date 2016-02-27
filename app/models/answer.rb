class Answer < ActiveRecord::Base

	validates :question_id, presence: true
	validates :title, presence: true
	validates :right, presence: true, inclusion: { in: ['0', '1'] }

	belongs_to :question
end
