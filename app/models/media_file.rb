class MediaFile < ActiveRecord::Base

	validates :url, presence: true
	validates :video, presence: true

	belongs_to :course
end
