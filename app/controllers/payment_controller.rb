class PaymentController < ApplicationController
	protect_from_forgery except: :payed

	def payed
		#if has_params
			#@user = User.find_by(email: params["payer_email"])
			#@course = Course.find_by(price: params["payment_gross"].to_i)
			#if @user.nil?
				#@user.email = params["payer_email"]
				#@user.name = params["first_name"] + " " + params["last_name"]
				#@user.password_digest = new_password
				#@user.level = "User"
			#end

			#if params["payment_status"] == "Completed"
				#if @user.save
					#UserMailer.welcome_email(@user).deliver_later
					#@purchased = Purchased.new(user_id: @user.id, course_id: @course.id)
					#@purchased.save
				#end
			#end
			#redirect_to thanks_path
		#end
		#redirect_to signin_path
		@user.email = params["payer_email"]
		@user.name = params["first_name"] + " " + params["last_name"]
		@user.password_digest = new_password
		@user.level = "User"
		@user.save
		redirect_to thanks_path
	end

	def thanks
	end

	private

	def has_params
		params["payer_email"] && params["payment_gross"] && params["payer_email"] && params["first_name"] && params["last_name"]
	end

	def level quantity
		return '1' if quantity == '10.00'
		return '2' if quantity == '15.00'
		return '3' if quantity == '25.00'
	end

end
