require 'rails_helper'

RSpec.describe AdminController, type: :controller do
	describe 'get#index' do
		it 'response with status OK' do
			get :index

			expect(response.status).to eq(200)
		end
	end

	describe 'get#users_index' do
		it 'response with status OK' do
			get :users_index

			expect(response.status).to eq(200)
		end
	end

	describe 'post#create_user' do
		let(:new_user){ build(:user) }
		it 'can create a user and redirect to admin user index' do
			number_of_users = User.count
			post :create_user, user: {name: new_user.name, password: new_user.password, level: new_user.level}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(number_of_users + 1).to eq User.count
		end

		it 'cannot create a user without level' do
			number_of_users = User.count
			post :create_user, user: {name: new_user.name, password: new_user.password, level: nil}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(number_of_users).to eq User.count
		end

		it 'cannot create a user without password' do
			number_of_users = User.count
			post :create_user, user: {name: new_user.name, password: nil, level: new_user.level}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(number_of_users).to eq User.count
		end

		it 'cannot create a user without name' do
			number_of_users = User.count
			post :create_user, user: {name: nil, password: new_user.password, level: new_user.level}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(number_of_users).to eq User.count
		end
	end

	describe 'get#delete_user' do
		it 'destroys a user and redirects to admin users index' do
			user_to_delete = create(:user)
			delete :delete_user, id: user_to_delete.id

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
		end
	end
end