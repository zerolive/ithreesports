class Purchased < ActiveRecord::Base
	validates :user_id, presence: true
	validates :course_id, presence: true

	belongs_to :user
	has_many :courses
end
