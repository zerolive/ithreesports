class UserController < ApplicationController

	def index
		@user = User.find(session[:user_id])
		level = @user.level.to_i
		@exams = []
		Exam.all.each do |exam|
			@exams << exam if exam.level.to_i <= level
		end
	end

	def user_exam
		@exam = Exam.find(params[:id])
		@questions = @exam.questions
		@completed_exam = CompletedExam.new
	end
end
