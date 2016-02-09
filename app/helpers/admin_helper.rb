module AdminHelper
	def checked boolean
		result = "<input type='checkbox'>"
		result = "<input type='checkbox' checked>" if boolean
		result.html_safe
	end
end
