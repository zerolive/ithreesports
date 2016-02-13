class AdminController < ApplicationController
	before_action :authenticate_admin

	def index

	end

	def admin_users
		@users = User.all
		@user = User.new
		@levels = User.levels
	end

	def create_user
		@user = User.new(user_params)
		@user.name = @user.name.downcase
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

	def new_question
		@exam = Exam.find(params[:id])
		@question = Question.new
	end

	def create_question
		@question = Question.new(question_params)
		@question.exam_id = params[:id]
		@question.save
		redirect_to exam_questions_path(@question.exam_id)
	end

	def exam_questions
		@exam = Exam.find(params[:id])
		@questions = @exam.questions
	end

	def edit_question
		@question = Question.find(params[:id])
	end

	def update_question
		@question = Question.find(params[:id])
		@question.update_attributes(question_params)
		redirect_to exam_questions_path(@question.exam_id)
	end

	def delete_question
		@question = Question.find(params[:id])
		@exam = Exam.find(@question.exam_id)
		@question.destroy
		redirect_to exam_questions_path(@exam)
	end

	def preview_exam
		@exam = Exam.find(params[:id])
		@questions = @exam.questions
	end

	private

		def user_params
			params.require(:user).permit(:name, :password, :level)
		end

		def exam_params
			params.require(:exam).permit(:title, :video, :level, :comment)
		end

		def question_params
			params.require(:question).permit(:title, :answer)
		end

		def authenticate_admin
			@admin = User.find(session[:user_id])
			redirect_to signin_path unless @admin.level == 'Admin'
		end
end
