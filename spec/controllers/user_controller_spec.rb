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
	end
end
