class HomeController < ApplicationController
	layout 'application'
  def index
  	@blogs = Admin::Blog.all
  end

  def blog
  	@blog = Admin::Blog.find(params[:id])
  end
end
