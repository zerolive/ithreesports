class CompletedExam < ActiveRecord::Base
	serialize :answers,Hash

	validates :user_id, presence: true
	validates :answers, presence: true
	validates :score, presence: true

	belongs_to :user
end
