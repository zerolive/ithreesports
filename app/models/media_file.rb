class MediaFile < ActiveRecord::Base

	validates :url, presence: true
	validates :video, presence: true
	validates :name, presence: true

	belongs_to :course
end
