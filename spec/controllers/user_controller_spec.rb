require 'rails_helper'

RSpec.describe UserController, type: :controller do

	context 'If user is not logged' do

		before do
			session[:user_token] = nil
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

		describe 'get#user_edit_info' do
			it 'redirects to sign path' do
				get :user_edit_info

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'post#user_update_info' do
			let(:user){ create(:user) }

			it 'redirects to sign path' do
				patch :user_update_info, id: user.id

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end

		describe 'get#user_course' do
			let(:course){ create(:course) }

			it 'redirects to sign path' do
				get :user_course, id: course.id

				expect(response.status).to eq 302
				expect(response).to redirect_to signin_path
			end
		end
	end

	context 'If user is logged' do
		let(:logged_user){create(:user)}

		before do
	    payload = {:data => logged_user.id}
	    session[:user_token] = JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
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
				expect(response).to redirect_to user_edit_info_path
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

		describe 'get#user_edit_info' do
			it 'responses with status ok' do
				get :user_edit_info

				expect(response.status).to eq 200
			end
		end

		describe 'post#user_update_info' do

			it 'redirects to user path' do
				new_info = { name: 'new_name', gender: 'Mujer'}

				patch :user_update_info, id: logged_user.id, user: new_info

				expect(response.status).to eq 302
				expect(response).to redirect_to user_path
			end

			it 'updates a user info' do
				new_info = { name: 'new_name', gender: 'Mujer'}

				patch :user_update_info, id: logged_user.id, user: new_info

				expect(assigns(:user).name).to eq  'new_name'
				expect(assigns(:user).gender).to eq  'Mujer'
			end
		end

		describe 'get#user_course' do
			let(:course){ create(:course) }

			it 'responses with status ok' do
				get :user_course, id: course.id

				expect(response.status).to eq 200
			end
		end
	end
end
