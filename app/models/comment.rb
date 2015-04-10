class Comment < ActiveRecord::Base
	belongs_to :concert

	validates :author, presence:true
	validates :content, presence:true
end
