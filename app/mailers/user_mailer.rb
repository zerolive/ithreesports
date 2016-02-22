class UserMailer < ApplicationMailer
	default from: 'noreply@i3sports.com'
 
	def welcome_email(user)
		@user = user
		@url  = 'http://www.i3sports.com/login'
		mail(to: @user.email, subject: t(:welcome_email_subject))
	end

	def reset_password_email(user)
		@user = user
		@url  = 'http://www.i3sports.com/login'
		mail(to: @user.email, subject: t(:reset_password))
	end
end
