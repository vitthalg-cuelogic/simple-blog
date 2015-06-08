class CommentsController < ApplicationController
	
	def create
  	@success = BlogComment.comment_on_blog(comments_params)
  	respond_to do |format|
  		format.js
  	end
  end

  private
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def comments_params
      params.require(:comment).permit(:text, :commented_by_name, :commented_by_email, :blog_id)
    end
end
