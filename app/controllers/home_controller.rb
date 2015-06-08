class HomeController < ApplicationController
	layout 'application'
  def index
  	@blogs = BlogList.get_list
  end

  def blog
  	@blog = Admin::Blog.find(params[:id])
  end
end
