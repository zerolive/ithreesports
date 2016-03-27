class Course < ActiveRecord::Base

	validates :name, presence: true
	validates :price, presence: true, uniqueness: true

	has_many :exam, :dependent => :destroy
	has_many :media_file, :dependent => :destroy
end
