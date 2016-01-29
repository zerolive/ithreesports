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
			expect(assigns(:user).errors.size).to eq 0
		end

		it 'cannot create a user without level' do
			number_of_users = User.count
			post :create_user, user: {name: new_user.name, password: new_user.password, level: nil}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(number_of_users).to eq User.count
			expect(assigns(:user).errors.size).to_not eq 0
		end

		it 'cannot create a user without password' do
			number_of_users = User.count
			post :create_user, user: {name: new_user.name, password: nil, level: new_user.level}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(number_of_users).to eq User.count
			expect(assigns(:user).errors.size).to_not eq 0
		end

		it 'cannot create a user without name' do
			number_of_users = User.count
			post :create_user, user: {name: nil, password: new_user.password, level: new_user.level}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(number_of_users).to eq User.count
			expect(assigns(:user).errors.size).to_not eq 0
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

	describe 'patch#update_user' do
		it ' saves the changes and redirects to users index' do
			user_to_edit = create(:user, name: 'OldName')
			patch :update_user, id: user_to_edit.id, user: { name: 'NewName', password: user_to_edit.password, level: user_to_edit.level}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(assigns(:user).name).to eq 'NewName'
			expect(assigns(:user).errors.size).to eq 0
		end

		it ' cannot save a user without name and redirects to users index' do
			user_to_edit = create(:user)
			patch :update_user, id: user_to_edit.id, user: { name: nil, password: user_to_edit.password, level: user_to_edit.level}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(assigns(:user).errors.size).to_not eq 0
		end

		it ' cannot save a user without password and redirects to users index' do
			user_to_edit = create(:user)
			patch :update_user, id: user_to_edit.id, user: { name: user_to_edit.name, password: nil, level: user_to_edit.level}

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(assigns(:user).errors.size).to_not eq 0
		end

		it ' cannot save a user without level and redirects to users index' do
			user_to_edit = create(:user)
			patch :update_user, id: user_to_edit.id, user: { name: user_to_edit.name, password: user_to_edit.password, level: nil }

			expect(response.status).to eq 302
			expect(response).to redirect_to admin_users_path
			expect(assigns(:user).errors.size).to_not eq 0
		end

	end
end