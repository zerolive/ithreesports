require 'rails_helper'
RSpec.describe ApplicationHelper, type: :helper do
	context 'Methods' do

	   describe 'checked' do
		  	it 'responds with unckecked check box if its false' do
		  		unckeckedbox = "<input type='checkbox'>"

		  		expect(checked(false)).to eq unckeckedbox
		  	end

		  	it 'responds with ckecked check box if its true' do
		  		unckeckedbox = "<input type='checkbox' checked>"

		  		expect(checked(true)).to eq unckeckedbox
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
	end
end
