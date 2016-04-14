class PaymentController < ApplicationController
	protect_from_forgery except: :payed

	DEFAULT_LEVEL = "User"
	COMPLETED_PARAM = "Completed"

	def payed
		params.permit!
		if has_params
			@user = User.find_by(email: params[:payer_email])
			@course = Course.find_by(price: params[:payment_gross].to_f)
			build_new_user if @user.nil?

			if payment_completed? && @user.save
				send_welcome_mail_to @user
				@purchased = Purchased.new(user_id: @user.id, course_id: @course.id)
				@purchased.save
			end
			redirect_to thanks_path
		else
			redirect_to signin_path
		end
	end

	def thanks
	end

	private

	def send_welcome_mail_to user
		UserMailer.welcome_email(user).deliver_later
	end

	def build_new_user
		@user = User.new
		@user.email = params[:payer_email]
		@user.name = params[:first_name] + " " + params[:last_name]
		@user.password_digest = new_password
		@user.level = DEFAULT_LEVEL
	end

	def payment_completed?
		params[:payment_status] == COMPLETED_PARAM
	end

	def has_params
		params[:payer_email] && params[:payment_gross] && params[:payer_email] && params[:first_name] && params[:last_name]
	end

end
