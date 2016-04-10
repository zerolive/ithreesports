require 'jwt'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create_token user_data
    payload = {:data => user_data}
    JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
  end

  def decode_token token
    decoded = JWT.decode token, ENV['HMAC_SECRET'], true, { :algorithm => 'HS256' }
    decoded.first['data']
  end

	private

	def new_password
		(Random.rand(100) + Time.now.to_i).to_s
	end
end
