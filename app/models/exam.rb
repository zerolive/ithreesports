class Exam < ActiveRecord::Base
	YOUTUBE_SORT = 'youtu.be'
	YOUTUBE_LONG = 'youtube.'
	LEVELS = ['User', 'Admin']

	validates :title, presence: true
	validates :level, presence: true, inclusion: LEVELS

	has_many :questions, :dependent => :destroy
	belongs_to :course

	def self.levels
		LEVELS
	end

	def video_id
		result = ''
		result = video.match(/(?:^.*\/)([^#?]*)/)[1] if video.include? YOUTUBE_SORT
		result = video.match(/(?:^.*\=)(.*)/)[1] if video.include? YOUTUBE_LONG
		result
	end

	def self.order_by_position
		self.all.order(:position)
	end
end