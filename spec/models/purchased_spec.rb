require 'rails_helper'

RSpec.describe Purchased, type: :model do
  describe 'Validations' do
  	let(:purchased){ build(:purchased) }

  	it 'can create a purchased' do
  		expect(purchased.save).to eq true
  	end

  	it 'cannot create a purchased without user_id' do
  		purchased.user_id = nil

  		expect(purchased.save).to eq false
  	end

  	it 'cannot create a purchased without course_id' do
  		purchased.course_id = nil

  		expect(purchased.save).to eq false
  	end
  end

  describe 'Associations' do
  	it 'belongs to user' do
  		expect(Purchased.reflect_on_association(:user).macro).to eq(:belongs_to)
  	end

  	it '' do
  		expect(Purchased.reflect_on_association(:courses).macro).to eq(:has_many)
  	end
  end
end
