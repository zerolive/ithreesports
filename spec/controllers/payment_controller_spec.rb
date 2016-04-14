require 'rails_helper'

RSpec.describe PaymentController, type: :controller do
	describe 'get#thanks' do
		it 'responds with status ok' do
			get :thanks

			expect(response.status).to eq 200
		end
	end

  describe '#payment' do
    let(:user){ create(:user) }
    let(:course){ create(:course) }

    it 'can recieve a POST' do
      post :payed

      expect(response.status).to eq 302
      expect(response).to redirect_to signin_path
    end

    it 'can recieve a GET' do
      get :payed

      expect(response.status).to eq 302
      expect(response).to redirect_to signin_path
    end

    it 'redirects to sign in path if has wrongs params' do
      get :payed, wrong_params: 'wrong_params'

      expect(response.status).to eq 302
      expect(response).to redirect_to signin_path
    end

    it 'redirects to thanks path if has correct params' do
      post :payed, { payer_email: user.email, payment_gross: course.price, first_name: user.name, last_name: user.name, payment_status: 'Completed' }

      expect(response.status).to eq 302
      expect(response).to redirect_to thanks_path
    end

    describe 'if buyer exists' do
      it 'adds a purchased to an existent user and redirects to thanks path' do
        post :payed, { payer_email: user.email, payment_gross: course.price, first_name: user.name, last_name: user.name, payment_status: 'Completed' }

        expect(assigns(:purchased).errors.size).to eq 0
        expect(response.status).to eq 302
        expect(response).to redirect_to thanks_path
      end
    end

    describe 'if buyer does not exist' do
      it 'adds a purchased to a new user and redirects to thanks path' do
        post :payed, { payer_email: user.email, payment_gross: course.price, first_name: user.name, last_name: user.name, payment_status: 'Completed' }

        expect(assigns(:user).errors.size).to eq 0
        expect(assigns(:purchased).errors.size).to eq 0
        expect(response.status).to eq 302
        expect(response).to redirect_to thanks_path
      end

      it 'sends an Email to new user' do
        expect(subject).to receive(:send_welcome_mail_to).with(user)

        post :payed, { payer_email: user.email, payment_gross: course.price, first_name: user.name, last_name: user.name, payment_status: 'Completed' }
      end
    end
  end
end