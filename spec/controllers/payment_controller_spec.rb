require 'rails_helper'

RSpec.describe PaymentController, type: :controller do
	describe 'get#thanks' do
		it 'responds with status ok' do
			get :thanks

			expect(response.status).to eq 200
		end
	end
end
