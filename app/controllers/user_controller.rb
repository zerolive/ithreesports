class UserController < ApplicationController

	def index
		@user = User.find(session[:user_id])
		@exams = Exam.where(level: @user.level)
	end
end
