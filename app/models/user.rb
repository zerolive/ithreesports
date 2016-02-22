class User < ActiveRecord::Base
	LEVELS = [ '1', '2', '3', 'Admin']

	has_secure_password
	
	validates :name, presence: true, length: { in: 5..12 }
	validates :password_digest, presence: true, length: { in: 8..12 }
	validates :level, presence: true, inclusion: LEVELS
	validates :email, presence: true, uniqueness: true

	has_many :completed_exam

	def self.levels
		LEVELS
	end
end
