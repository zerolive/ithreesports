class UserController < ApplicationController
	before_action :user_logged?

	def index
		@user = User.find(session[:user_id])
		level = @user.level.to_i
		@exams = []
		Exam.all.each do |exam|
			@exams << exam if exam.level.to_i <= level
		end
		@completed_exam = CompletedExam.where(user_id: @user.id)
	end

	def user_exam
		@exam = Exam.find(params[:id])
		@questions = @exam.questions
	end

	def user_exam_save
		exam = Exam.find(params[:id])

		delete_old_completed_exam exam.id

		score = calculate_score params
		new_completed_exam exam, score

		redirect_to user_path
	end

	private

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
		old_completed_exam.destroy if old_completed_exam.nil?
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

	private

	def user_logged?
		redirect_to signin_path unless session[:user_id]
	end

end
