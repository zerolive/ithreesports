class AdminController < ApplicationController

	def index

	end

	def users_index
		@users = User.all
		@user = User.new
		@levels = User.levels
	end

	def create_user
		@user = User.new(user_params)
		@user.save
		redirect_to admin_users_path
	end

	def delete_user
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admin_users_path
	end

	def edit_user
		@user = User.find(params[:id])
		@levels = User.levels
	end

	def update_user
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
		@user.save
		redirect_to admin_users_path
	end

	def admin_exams
		@exam = Exam.new
		@exams = Exam.all
		@levels = Exam.levels
	end

	def create_exam
		@exam = Exam.new(exam_params)
		@exam.save
		redirect_to admin_exams_path
	end

	def edit_exam
		@exam = Exam.find(params[:id])
		@levels = Exam.levels
	end

	def update_exam
		@exam = Exam.find(params[:id])
		@exam.update_attributes(exam_params)
		@exam.save
		redirect_to admin_exams_path
	end

	def delete_exam
		@exam = Exam.find(params[:id])
		@exam.destroy
		redirect_to admin_exams_path
	end

	private

		def user_params
			params.require(:user).permit(:name, :password, :level)
		end

		def exam_params
			params.require(:exam).permit(:title, :video, :level, :comment)
		end
end
