class UserMailer < ApplicationMailer
	default from: 'noreply@i3sports.com'
 
	def welcome_email user
		@user = user
		@url  = 'http://www.i3sports.com/login'
		mail(to: @user.email, subject: t(:welcome_email_subject))
	end

	def reset_password_email user
		@user = user
		@url  = 'http://www.i3sports.com/login'
		mail(to: @user.email, subject: t(:reset_password))
	end

	def completed_exam_email user, exam, completed_exam
		@user = user
		@exam = exam
		@completed_exam = completed_exam
		@admins = User.where(level: 'Admin')
		@admins.each do |admin|
			mail(to: admin.email, subject: t(:completed_exam))
		end
	end
end
