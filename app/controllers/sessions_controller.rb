class SessionsController < ApplicationController

	def new
		session.delete(:user_id) if session[:user_id]
	end

	def create
		@user = User.find_by(email: params[:email])
		if user_authenticate
			session[:user_id] = @user.id
			redirect_to admin_path if @user.level == 'Admin'
			redirect_to user_path if @user.level != 'Admin'
		else
			redirect_to root_path
		end
	end

	def destroy
   		session.delete(:user_id)
   		redirect_to root_path
	end

	def buy
	end

	def reset_password
	end

	private

	def user_authenticate
		return false unless @user
		return false unless @user.password_digest == params[:password_digest]
		true
	end
end