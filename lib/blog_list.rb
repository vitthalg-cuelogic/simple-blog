class BlogList

	def initialize(*opts)
		if opts.blank?
			@collection = Admin::Blog.all
		else
			@collection = Admin::Blog.where(opts)
		end
	end
	
	def get_list
		@collection
	end
end