class PaymentController < ApplicationController
	protect_from_forgery except: :payed

	def payed
		@user = User.new
		@user.email = params[:payer_email]
		@user.name = params[:first_name] + " " + params[:last_name]
		@user.password_digest = "12345678" #params[:txn_id]
		@user.level = "1" #level(params[:mc_gross])
		#if params[:payment_status] == 'Completed'
		if params[:payer_email] != ""
		@user.save
		#UserMailer.welcome_email(@user).deliver_later
		end
		redirect_to root_path
	end

	private

	def level quantity
		return '1' if quantity == '10.00'
		return '2' if quantity == '15.00'
		return '3' if quantity == '25.00'
	end

end
