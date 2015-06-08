class BlogComment

	def self.comment_on_blog(comment_params)
		@comment = Comment.new(comment_params)
		@comment.save
	end		
end