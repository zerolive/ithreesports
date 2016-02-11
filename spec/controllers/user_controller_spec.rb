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
