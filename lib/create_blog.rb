class CreateBlog

	def initialize(opts)
		@blog = Admin::Blog.new(opts)
	end

	def self.new_blog
		Admin::Blog.new
	end
	
	def self.publish_new_blog(new_blog_params)
		@blog = Admin::Blog.new(new_blog_params)
		@blog.save
	end

	def self.blog
		@blog
	end
end