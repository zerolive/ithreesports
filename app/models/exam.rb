class Exam < ActiveRecord::Base
	LEVELS = [ '1', '2', '3']

	validates :title, presence: true
	validates :level, presence: true, inclusion: LEVELS

	has_many :questions

	def self.levels
		LEVELS
	end
end
