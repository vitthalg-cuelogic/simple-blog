class Admin::Blog < ActiveRecord::Base
	validates :title, :body, presence: true
	validates :title, uniqueness: true
	validates :body, length: { minimum: 100 }
end
