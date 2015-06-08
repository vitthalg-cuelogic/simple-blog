class HomeController < ApplicationController
	layout 'application'
  def index
  	@blogs = BlogList.new.get_list
  end

  def blog
  	@blog = Admin::Blog.find(params[:id])
  	@comments = Comment.comments_for_blog(@blog.id)
  end

end
