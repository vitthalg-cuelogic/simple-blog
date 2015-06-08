class Comment < ActiveRecord::Base
  belongs_to :blog
  scope :comments_for_blog, lambda { |id|
    where(blog_id: id)
  }
end
