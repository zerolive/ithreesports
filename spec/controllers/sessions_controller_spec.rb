require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	describe 'get#new' do
		it ' response with status OK' do
			get :new

			expect(response.status).to eq(200)
		end
	end

	describe 'post#create' do
		let(:new_admin){ create(:admin) }
		let(:new_user){ create(:user) }
		
		it 'redirects to root path if params are empty' do
			post :create

			expect(response.status).to eq(302)
			expect(response).to redirect_to root_path
		end

		it ' redirects to root path if user does not exist' do
			post :create, name: 'userdoesnotexistindatabase', password: 'userdoesnotexistindatabase'

			expect(response.status).to eq(302)
			expect(response).to redirect_to root_path
		end

		it ' redirects to admin path if user has level admin' do
			post :create, name: new_admin.name , password: new_admin.password

			expect(response.status).to eq(302)
			expect(response).to redirect_to admin_path
		end

		it ' redirects to user path if user has not level admin' do
			post :create, name: new_user.name , password: new_user.password

			expect(response.status).to eq(302)
			expect(response).to redirect_to user_path
		end
	end

	describe 'get#destroy' do
		let(:logged_user){ create(:user) }

		it 'destroy the session and redirects to root path' do
			session[:user_id] = logged_user.id
			get :destroy

			expect(session).to be {}
			expect(response).to redirect_to root_path
		end
	end
end
