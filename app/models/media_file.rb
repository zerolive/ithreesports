class MediaFile < ActiveRecord::Base

	validates :url, presence: true

	belongs_to :course
end
