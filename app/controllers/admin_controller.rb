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

	private

		def user_params
			params.require(:user).permit(:name, :password, :level)
		end
end
