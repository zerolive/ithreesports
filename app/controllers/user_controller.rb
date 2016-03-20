class UserController < ApplicationController
	before_action :user_logged?
	before_action :set_user

	def index
		@exams = exams_belonging_user
		@completed_exam = CompletedExam.where(user_id: @user.id)
		purchases = Purchased.where(user_id: @user.id)
		@purchased_courses = []
		purchases.to_a.each do |p|
			@purchased_courses << Course.find(p.course_id)
		end
	end

	def user_exam
		@exam = Exam.find(params[:id])
		@video = @exam.video_id
		@questions = @exam.questions
	end

	def user_exam_save
		exam = Exam.find(params[:id])

		delete_old_completed_exam exam.id

		score = calculate_score params
		new_completed_exam exam, score

		redirect_to user_path
	end

	def change_password
	end

	def update_password
		if can_change_password?
			@user.password_digest = params[:new_password]
			@user.save
		end
		redirect_to user_edit_info_path
	end

	def user_edit_info
		@genders = User.genders
	end

	def user_update_info
		if @user.id.to_s == params[:id]
			@user.name = params[:user][:name]
			@user.gender = params[:user][:gender]
			@user.save
		end
		redirect_to user_path
	end

	def user_course
		@course = Course.find(params[:id])
		@completed_exam = CompletedExam.where(user_id: @user.id)
		@media_files = @course.media_file
		@exams = @course.exam
	end

	private

	def set_user
		@user = User.find(session[:user_id])
	end

	def can_change_password?
		old_password_is_right? and new_password_is_right?
	end

	def new_password_is_right?
		params[:new_password] == params[:repeat_new_password]
	end

	def old_password_is_right?
		@user.password_digest == params[:old_password]
	end

	def calculate_score params
		score = 0
		params.each do | key, value |
			if key.to_i != 0
				answer = Answer.find(value.to_i)
				score += 1 if answer.right == '1'
			end
		end
		score
	end

	def delete_old_completed_exam exam_id
		old_completed_exam = CompletedExam.where(user_id: session[:user_id]).where(exam_id: exam_id)
		old_completed_exam.first.destroy unless old_completed_exam.empty?
	end

	def new_completed_exam exam, score
		completed_exam = CompletedExam.new({
				:user_id => session[:user_id], 
				:questions => exam.questions.count, 
				:score => score, 
				:exam_id => exam.id 
			})
		completed_exam.save
	end

	def user_logged?
		redirect_to signin_path unless session[:user_id]
	end

	def exams_belonging_user
		level = @user.level.to_i
		exams = []
		Exam.order_by_position.each do |exam|
			exams << exam if exam.level.to_i <= level
		end
		exams
	end
end
