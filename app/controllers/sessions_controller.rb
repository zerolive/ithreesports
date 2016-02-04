class SessionsController < ApplicationController

	def new
		session.delete(:user_id) if session[:user_id]
	end

	def create
		@user = User.find_by(name: params[:name])
		if user_authenticate
			session[:user_id] = @user.id
			redirect_to admin_path
		else
			redirect_to root_path
		end
	end

	def destroy
   		session.delete(:user_id)
   		redirect_to root_path
	end

	private

	def user_authenticate
		return false unless @user
		return false unless @user.password == params[:password]
		true
	end
end