class Exam < ActiveRecord::Base
	YOUTUBE_SORT = 'youtu.be'
	YOUTUBE_LONG = 'youtube.'
	LEVELS = [ '1', '2', '3']

	validates :title, presence: true
	validates :level, presence: true, inclusion: LEVELS

	has_many :questions

	def self.levels
		LEVELS
	end

	def video_id
		result = ''
		result = video.match(/(?:^.*\/)([^#?]*)/)[1] if video.include? YOUTUBE_SORT
		result = video.match(/(?:^.*\=)(.*)/)[1] if video.include? YOUTUBE_LONG
		result
	end
end