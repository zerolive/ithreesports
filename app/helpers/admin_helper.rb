module AdminHelper
	def checked boolean
		result = "<input type='checkbox'>"
		result = "<input type='checkbox' checked>" if boolean
		result.html_safe
	end

	def youtube_iframe video_id
		"<iframe id='ytplayer' type='text/html' width='640' height='390'
		  src='https://www.youtube.com/embed/#{video_id}?autoplay'=1='0'/></iframe>".html_safe
	end
end
