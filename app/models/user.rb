class User < ActiveRecord::Base
	LEVELS = ['User', 'Admin']
	GENDER = ['Hombre', 'Mujer']

	before_save :default_values
	has_secure_password
	
	validates :name, presence: true, length: { in: 5..12 }
	validates :password_digest, presence: true, length: { in: 8..12 }
	validates :level, presence: true, inclusion: LEVELS
	validates :email, presence: true, uniqueness: true

	has_many :completed_exam
	has_many :purchased

	def default_values
	  self.gender ||= GENDER[0]
	end

	def self.levels
		LEVELS
	end

	def self.genders
		GENDER
	end
end
