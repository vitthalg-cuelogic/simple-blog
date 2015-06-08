class Admin::BlogsController < ApplicationController
  before_action :set_admin_blog, only: [:show, :edit, :update, :destroy]
  layout 'admin'
  # GET /admin/blogs
  # GET /admin/blogs.json
  def index
    @blogs = Admin::Blog.all
  end

  # GET /admin/blogs/1
  # GET /admin/blogs/1.json
  def show
  end

  # GET /admin/blogs/new
  def new
    @blog = Admin::Blog.new
  end

  # GET /admin/blogs/1/edit
  def edit
  end

  # POST /admin/blogs
  # POST /admin/blogs.json
  def create
    respond_to do |format|
      if CreateBlog.publish_new_blog(admin_blog_params)
        format.html { respond_on_success('create') }
      else
        @blog = CreateBlog.blog
        format.html { render action: 'new' }        
      end
    end
  end

  def respond_on_success(action)
     redirect_to admin_blogs_path, notice: "Blog was successfully #{action}d."    
  end

  # PATCH/PUT /admin/blogs/1
  # PATCH/PUT /admin/blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(admin_blog_params)
        format.html { respond_on_success('update') }
      else        
        format.html { render action: 'edit' }        
      end
    end
  end

  # DELETE /admin/blogs/1
  # DELETE /admin/blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_blog
      @blog = Admin::Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_blog_params
      params.require(:admin_blog).permit(:title, :body)
    end
end
