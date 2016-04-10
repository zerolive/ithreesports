class SessionsController < ApplicationController
	NUMBER_OF_COLUMNS = 3

	before_action :set_user, only: [:create, :send_password]

	def new
		session.delete(:user_token) if session[:user_token]
	end

	def create
		if user_authenticate
			session[:user_token] = user_authenticate
			redirect_to admin_path if @user.level == 'Admin'
			redirect_to user_path if @user.level != 'Admin'
		else
			redirect_to root_path
		end
	end

	def destroy
   		session.delete(:user_token)
   		redirect_to root_path
	end

	def buy
		@courses = Course.all
		@number_of_columns = NUMBER_OF_COLUMNS
	end

	def reset_password
	end

	def send_password
		if @user
			@user.update(password_digest: new_password)
			UserMailer.reset_password_email(@user).deliver_later if @user.save
		end
		redirect_to root_path
	end

	private

	def user_authenticate
		return false unless @user
		return false unless @user.password_digest == params[:password_digest]
		create_token(@user.id)
	end

	def set_user
		@user = User.find_by(email: params[:email])
	end
end