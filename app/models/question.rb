class Question < ActiveRecord::Base
	validates :title, presence: true
	validates :answer, presence: true

	belongs_to :exam
end
