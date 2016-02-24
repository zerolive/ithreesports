require 'rails_helper'

RSpec.describe UserController, type: :controller do

	context 'If user is not logged' do

		before do
			session[:user_id] = nil
		end

		describe 'get#index' do
			it 'redirects to sign path' do

				get :index

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#user_exam' do
			let(:exam){ create(:exam) }

			it 'redirects to sign path' do
				get :user_exam, id: exam.id

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'post#user_exam_save' do
			let(:exam){ create(:exam) }

			it 'redirects to sign path' do
				post :user_exam_save, id: exam.id

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#change_password' do

			it 'redirects to sign path' do
				get :change_password

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'post#update_password' do

			it 'redirects to sign path' do
				post :update_password

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end
	end

	context 'If user is logged' do
		let(:logged_user){create(:user)}

		before do
			session[:user_id] = logged_user.id
		end

		describe 'get#index' do
			it 'respond with status OK' do

				get :index

				expect(response.status).to eq 200
			end
		end

		describe 'get#user_exam' do
			let(:exam){ create(:exam) }

			it 'respond with status OK' do
				get :user_exam, id: exam.id

				expect(response.status).to eq 200
			end
		end

		describe 'post#user_exam_save' do
			let(:exam){ create(:exam) }

			it 'redirects to user path' do
				post :user_exam_save, id: exam.id

				expect(response.status).to eq 302
				expect(response).to redirect_to user_path
			end
		end

		describe 'get#change_password' do

			it 'responds with status OK' do
				get :change_password

				expect(response.status).to eq 200
			end
		end

		describe 'post#update_password' do

			it 'redirects to user path' do
				newpassword = '1234567890'

				post :update_password, old_password: logged_user.password_digest, new_password: newpassword, repeat_new_password: newpassword

				expect(response.status).to eq 302
				expect(response).to redirect_to user_path
			end

			it 'change password if old and new password are right' do
				newpassword = '1234567890'

				post :update_password, old_password: logged_user.password_digest, new_password: '1234567890', repeat_new_password: '1234567890'

				expect(assigns(:user).password_digest).to eq newpassword
			end

			it 'does not change password if old password is wrong' do
				newpassword = '1234567890'

				post :update_password, old_password: 'wrong_password', new_password: '1234567890', repeat_new_password: '1234567890'

				expect(assigns(:user).password_digest).to_not eq newpassword
			end

			it 'does not change password if new password is wrong' do
				newpassword = '1234567890'

				post :update_password, old_password: logged_user.password_digest, new_password: 'new_password_one', repeat_new_password: 'new_password_two'

				expect(assigns(:user).password_digest).to_not eq newpassword
			end
		end
	end
end
