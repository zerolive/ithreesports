class UserController < ApplicationController
	before_action :user_logged?

	def index
		@user = User.find(session[:user_id])
		@exams = exams_belonging_user
		@completed_exam = CompletedExam.where(user_id: @user.id)
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
		@user = User.find(session[:user_id])
	end

	def update_password
		@user = User.find(session[:user_id])
		if can_change_password?
			@user.password_digest = params[:new_password]
			@user.save
		end
		redirect_to user_path
	end

	private

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
				question = Question.find(key.to_i)
				answer = false
				answer = true if value == '1'
				score += 1 if answer == question.answer
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
				:answers => exam.questions.count, 
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
