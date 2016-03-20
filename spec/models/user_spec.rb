require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'Validations' do

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

		it 'cannot create a user without password' do
			newuser = build(:user, password: nil)
			expect(newuser.save).to eq false
		end

		it 'cannot create a user without email' do
			newuser = build(:user, email: nil)
			expect(newuser.save).to eq false
		end

		it 'cannot create two users with same email' do
			olduser = create(:user)
			newuser = build(:user, email: olduser.email)
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

		it 'can create a user with level User' do
			newuser = build(:user, level: 'User')
			expect(newuser.save).to eq true
		end

		it 'can create a user with level Admin' do
			newuser = build(:user, level: 'Admin')
			expect(newuser.save).to eq true
		end

		it 'fills gender field with Hombre by default' do
			newuser = build(:user, gender: nil)

			expect(newuser.save).to eq true
			expect(newuser.gender).to eq 'Hombre'
		end
	end	

  describe 'Associations' do
      it 'has many completed exam' do
        	expect(User.reflect_on_association(:completed_exam).macro).to eq(:has_many)
      end
      it 'has many completed exam' do
        	expect(User.reflect_on_association(:purchased).macro).to eq(:has_many)
      end
   end 

	describe 'Methods' do
		it 'knows the differents levels' do
			expect(User.levels).to eq([ 'User', 'Admin'])
		end

		it 'knows the differents genders' do
			expect(User.genders).to eq(['Hombre', 'Mujer'])
		end
	end
end