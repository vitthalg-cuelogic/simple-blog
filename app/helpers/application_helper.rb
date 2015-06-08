module ApplicationHelper

	def formatted_date(datetime)
		datetime.strftime('%B %d, %Y')
	end
end
