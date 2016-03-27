class Question < ActiveRecord::Base
	validates :title, presence: true
	validates :exam_id, presence: true

	belongs_to :exam
	has_many :answer, :dependent => :destroy
end
