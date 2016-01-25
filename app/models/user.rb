class User < ActiveRecord::Base
	LEVELS = [ '1', '2', '3', 'Admin']
	validates :name, presence: true, uniqueness: true, length: { in: 5..12 }
	validates :password, presence: true, length: { in: 8..12 }
	validates :level, presence: true, inclusion: LEVELS

	def self.levels
		LEVELS
	end
end
