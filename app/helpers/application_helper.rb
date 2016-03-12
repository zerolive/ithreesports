module ApplicationHelper

	MAX_PRICE = 1000000

	def checked right
		result = "<input type='radio' disabled='true'>"
		result = "<input type='radio' checked disabled='true'>" if right == '1'
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

	def show_logout
		link_to t(:log_out), logout_path if session[:user_id]
	end

	def show_home
			return (link_to t(:home), admin_path, class: "logo-button") if @admin
			return (link_to t(:home), user_path, class: "logo-button") if @user
	end

	def image_url_icon(url)
		return "<a href='#{url}' target='_blank'><span class='fi-photo'></span></a>".html_safe unless url.empty?
		"<span class='fi-photo'></span>".html_safe
	end

	def video_url_icon(url)
		return "<a href='#{url}' target='_blank'><span class='fi-play-video'></span></a>".html_safe unless url.empty?
		"<span class='fi-play-video'></span>".html_safe
	end

	def max_price
		MAX_PRICE
	end

	def media_file_link file
		return "<center><a href='#{file.url}' target='_blank'><span class='fi-photo'></span></a></center>".html_safe unless file.url.empty?
		"<center><span class='fi-photo'></span></center>".html_safe
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