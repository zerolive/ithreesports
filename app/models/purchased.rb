class Purchased < ActiveRecord::Base
	validates :user_id, presence: true
	validates :course_id, presence: true

	belongs_to :user
	has_many :courses

  def self.for user
    purchases = where(user_id: user.id)
    purchased_courses = []
    purchases.to_a.each do |p|
      purchased_courses << Course.find(p.course_id)
    end
    purchased_courses
  end

  def find_by user_id, course_id
    purchased = self.where(user_id: user_id).where(course_id: course_id)
    purchased.first
  end

  def self.find_by_user_id user_id
    purchases = self.where(user_id: user_id)
    purchased_courses = []
    purchases.to_a.each do |p|
      purchased_courses << Course.find(p.course_id)
    end
    purchased_courses
  end
end
