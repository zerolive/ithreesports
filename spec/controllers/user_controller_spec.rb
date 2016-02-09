require 'rails_helper'

RSpec.describe UserController, type: :controller do

	describe 'get#index' do
		let(:user){ create(:user)}

		it 'respond with status OK' do
			session[:user_id] = user.id

			get :index

			expect(response.status).to eq 200
		end
	end
end
