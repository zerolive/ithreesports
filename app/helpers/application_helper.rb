module ApplicationHelper

	def checked boolean
		result = "<input type='checkbox'>"
		result = "<input type='checkbox' checked>" if boolean
		result.html_safe
	end

	def youtube_iframe video_id
		"<iframe id='ytplayer' type='text/html' width='640' height='390'
		  src='https://www.youtube.com/embed/#{video_id}?autoplay'=1='0'/></iframe>".html_safe
	end

	def paypal_url quantity
		item_name = item_text(quantity)
		link_name = link_text(quantity)
		"<a href='https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=antonioc3brian%2dfacilitator%40gmail%2ecom&lc=US&item_name=#{item_name}&item_number=1&amount=#{quantity}%2e00&currency_code=USD&notify_url=https%3a%2f%2fgentle%2dwaters%2d42879%2eherokuapp%2ecom%2fpayed%2f&return=https%3a%2f%2fgentle%2dwaters%2d42879%2eherokuapp%2ecom%2fpayed%2f&button_subtype=services&no_note=0&bn=PP%2dBuyNowBF%3abtn_buynowCC_LG%2egif%3aNonHostedGuest'>#{link_name}</a>".html_safe
	end

	def avatar_for(gender)
		return 'mujer' if gender == 'Mujer'
		'hombre'
	end

	private

	def item_text(quantity)
		return "Curso%20Basico" if quantity == 10
		return "Curso%20Avanzado" if quantity == 15
		return "Curso%20Profesional" if quantity == 25
	end

	def link_text(quantity)
		return "Curso Basico" if quantity == 10
		return "Curso Avanzado" if quantity == 15
		return "Curso Profesional" if quantity == 25
	end
end