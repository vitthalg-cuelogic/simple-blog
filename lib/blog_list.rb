class BlogList

	def self.get_list(*opts)
		if opts.blank?
			Admin::Blog.all
		else
			Admin::Blog.where(opts)
		end
	end
end