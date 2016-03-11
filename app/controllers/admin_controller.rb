class AdminController < ApplicationController
	before_action :authenticate_admin
	before_action :set_exam, only: [:edit_exam, :update_exam, :delete_exam, :new_question, :exam_questions, :preview_exam]
	before_action :set_user, only: [:delete_user, :edit_user, :update_user]
	before_action :set_question, only: [:edit_question, :update_question, :delete_question, :new_answer, :create_answer]
	before_action :set_answer, only: [:edit_answer, :update_answer, :delete_answer]
	before_action :set_course, only: [:edit_course, :update_course, :delete_course, :preview_course ]

	def index
	end

	def admin_users
		@users = User.all.order(:level).reverse_order
		@user = User.new
		@levels = User.levels
	end

	def create_user
		@user = User.new(user_params)
		@user.name = @user.name.downcase if @user.name
		UserMailer.welcome_email(@user).deliver_later if @user.save
		redirect_to admin_users_path
	end

	def delete_user
		@user.destroy
		redirect_to admin_users_path
	end

	def edit_user
		@levels = User.levels
	end

	def update_user
		@user.update_attributes(user_params)
		@user.save
		redirect_to admin_users_path
	end

	def admin_courses
		@course = Course.new
		@courses = Course.all
	end

	def create_course
		@course = Course.new(course_params)
		@course.save
		redirect_to admin_courses_path
	end

	def edit_course
	end

	def update_course
		@course.update_attributes(course_params)
		redirect_to admin_courses_path
	end

	def delete_course
		@course.destroy
		redirect_to admin_courses_path
	end

	def preview_course
	end

	def admin_exams
		@exam = Exam.new
		@exams = Exam.order_by_position
		@levels = Exam.levels
	end

	def create_exam
		@exam = Exam.new(exam_params)
		@exam.save
		redirect_to admin_exams_path
	end

	def edit_exam
		@levels = Exam.levels
	end

	def update_exam
		@exam.update_attributes(exam_params)
		@exam.save
		redirect_to admin_exams_path
	end

	def delete_exam
		@exam.destroy
		redirect_to admin_exams_path
	end

	def new_question
		@question = Question.new
	end

	def create_question
		@question = Question.new(question_params)
		@question.exam_id = params[:id]
		@question.save
		redirect_to exam_questions_path(@question.exam_id)
	end

	def exam_questions
		@questions = @exam.questions
	end

	def edit_question
	end

	def update_question
		@question.update_attributes(question_params)
		redirect_to exam_questions_path(@question.exam_id)
	end

	def delete_question
		@exam = Exam.find(@question.exam_id)
		@question.destroy
		redirect_to exam_questions_path(@exam)
	end

	def preview_exam
		@video = @exam.video_id
		@questions = @exam.questions
	end

	def new_answer
		@answer = Answer.new
	end

	def create_answer
		@answer = Answer.new(answer_params)
		@answer.question_id = @question.id
		@answer.save
		redirect_to exam_questions_path(@question.exam_id)
	end

	def edit_answer
		@question = Question.find(@answer.question_id)
	end

	def update_answer
		@question = Question.find(@answer.question_id)
		@answer.update_attributes(answer_params)
		redirect_to exam_questions_path(@question.exam_id)
	end

	def delete_answer
		@question = Question.find(@answer.question_id)
		@answer.destroy
		redirect_to exam_questions_path(@question.exam_id)
	end

	private

		def set_course
			@course = Course.find(params[:id])
		end

		def course_params
			params.require(:course).permit(:name, :imageurl, :videourl, :price, :description)
		end

		def set_answer
			@answer = Answer.find(params[:id])
		end

		def set_question
			@question = Question.find(params[:id])
		end

		def set_user
			@user = User.find(params[:id])
		end

		def set_exam
			@exam = Exam.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:email, :name, :password_digest, :level)
		end

		def answer_params
			params.require(:answer).permit(:title, :right)
		end

		def exam_params
			params.require(:exam).permit(:title, :video, :level, :comment, :position)
		end

		def question_params
			params.require(:question).permit(:title)
		end

		def authenticate_admin
			redirect_to signin_path unless session[:user_id]
				
			if session[:user_id]
				@admin = User.find(session[:user_id])
				redirect_to signin_path unless @admin.level == 'Admin'				
			end
		end
end
