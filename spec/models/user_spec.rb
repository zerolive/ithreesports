require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'Model' do

		it 'can create a user' do
			newuser = build(:user)
			expect(newuser.save).to eq true

	end
		it 'cannot create a user without name' do
			newuser = build(:user, name: nil)
			expect(newuser.save).to eq false
		end

		it 'cannot create a user with name sorter than five characters' do
			newuser = build(:user, name: '1234')
			expect(newuser.save).to eq false
		end

		it 'cannot create a user with name longer than 12 characters' do
			newuser = build(:user, name: '1234567890123')
			expect(newuser.save).to eq false
		end

		it 'cannot create two users with same name' do
			newuser = create(:user, name: 'JohnDoe')
			newuser2 = build(:user, name: 'JohnDoe')
			expect(newuser2.save).to eq false
		end

		it 'cannot create a user without password' do
			newuser = build(:user, password: nil)
			expect(newuser.save).to eq false
		end

		it 'cannot create a user with password sorter than 8 characters' do
			newuser = build(:user, password: '1234')
			expect(newuser.save).to eq false
		end

		it 'cannot create a user with password longer than 12 characters' do
			newuser = build(:user, password: '1234567890123')
			expect(newuser.save).to eq false
		end

		it 'cannot create a user without level' do
			newuser = build(:user, level: nil)
			expect(newuser.save).to eq false
		end

		it 'cannot create a user with any level value' do
			newuser = build(:user, level: 'J')
			expect(newuser.save).to eq false
		end

		it 'can create a user with level 1' do
			newuser = build(:user, level: '1')
			expect(newuser.save).to eq true
		end

		it 'can create a user with level 2' do
			newuser = build(:user, level: '2')
			expect(newuser.save).to eq true
		end

		it 'can create a user with level 3' do
			newuser = build(:user, level: '3')
			expect(newuser.save).to eq true
		end

		it 'can create a user with level Admin' do
			newuser = build(:user, level: 'Admin')
			expect(newuser.save).to eq true
		end

		it 'knows the differents levels' do
			expect(User.levels).to eq [ '1', '2', '3', 'Admin']
		end
	end	
end
