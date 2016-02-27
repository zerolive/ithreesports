require 'rails_helper'
RSpec.describe ApplicationHelper, type: :helper do
	context 'Methods' do

	   describe 'checked' do
		  	it 'responds with unckecked radio if its field right is 0' do
		  		right = '0'

		  		unckeckedbox = "<input type='radio' disabled='true'>"

		  		expect(checked(right)).to eq unckeckedbox
		  	end

		  	it 'responds with ckecked radio if its  field right is 1' do
		  		right = '1'

		  		unckeckedbox = "<input type='radio' checked disabled='true'>"

		  		expect(checked(right)).to eq unckeckedbox
		  	end
	   end

	   describe 'youtube_iframe' do
	   		it 'responds with html code for youtube player with a video id' do
	   			id = 'VIDEOID'

	   			iframe = "<iframe id='ytplayer' type='text/html' width='640' height='390'
		  src='https://www.youtube.com/embed/#{id}?autoplay'=1='0'/></iframe>"

	   			expect(youtube_iframe(id)).to eq iframe
	   		end
	   end

	   describe 'paypal_url' do
	   		it 'returns paypal link for quantity 10 for Curso Basico' do
	   			quantity = 10

	   			pay_url = "<a href='https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=antonioc3brian%2dfacilitator%40gmail%2ecom&lc=US&item_name=Curso%20Basico&item_number=1&amount=10%2e00&currency_code=USD&notify_url=https%3a%2f%2fgentle%2dwaters%2d42879%2eherokuapp%2ecom%2fpayed%2f&return=https%3a%2f%2fgentle%2dwaters%2d42879%2eherokuapp%2ecom%2fpayed%2f&button_subtype=services&no_note=0&bn=PP%2dBuyNowBF%3abtn_buynowCC_LG%2egif%3aNonHostedGuest'>Curso Basico</a>"

	   			expect(paypal_url(quantity)).to eq pay_url
	   		end

	   		it 'returns paypal link for quantity 15 for Curso Avanzado' do
	   			quantity = 15

	   			pay_url = "<a href='https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=antonioc3brian%2dfacilitator%40gmail%2ecom&lc=US&item_name=Curso%20Avanzado&item_number=1&amount=15%2e00&currency_code=USD&notify_url=https%3a%2f%2fgentle%2dwaters%2d42879%2eherokuapp%2ecom%2fpayed%2f&return=https%3a%2f%2fgentle%2dwaters%2d42879%2eherokuapp%2ecom%2fpayed%2f&button_subtype=services&no_note=0&bn=PP%2dBuyNowBF%3abtn_buynowCC_LG%2egif%3aNonHostedGuest'>Curso Avanzado</a>"

	   			expect(paypal_url(quantity)).to eq pay_url
	   		end

	   		it 'returns paypal link for quantity 25 for Curso Profesional' do
	   			quantity = 25

	   			pay_url = "<a href='https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=antonioc3brian%2dfacilitator%40gmail%2ecom&lc=US&item_name=Curso%20Profesional&item_number=1&amount=25%2e00&currency_code=USD&notify_url=https%3a%2f%2fgentle%2dwaters%2d42879%2eherokuapp%2ecom%2fpayed%2f&return=https%3a%2f%2fgentle%2dwaters%2d42879%2eherokuapp%2ecom%2fpayed%2f&button_subtype=services&no_note=0&bn=PP%2dBuyNowBF%3abtn_buynowCC_LG%2egif%3aNonHostedGuest'>Curso Profesional</a>"

	   			expect(paypal_url(quantity)).to eq pay_url
	   		end
	   end

	   describe 'avatar_for' do
	   		it 'return mujer if gender is Mujer' do
	   			gender = 'Mujer'

	   			expect(avatar_for(gender)).to eq 'mujer'
	   		end

	   		it 'return hombre if gender not contais mujer' do
	   			expect(avatar_for('')).to eq 'hombre'
	   			expect(avatar_for('gender')).to eq 'hombre'
	   			expect(avatar_for('lalalalala')).to eq 'hombre'
	   		end
	   end
	end
end
