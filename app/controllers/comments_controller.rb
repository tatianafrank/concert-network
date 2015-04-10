class CommentsController < ApplicationController
	def new
		@concert=Concert.find params[:concert_id]
		@comment=@concert.comments.new
	end
	def create
		@concert=Concert.find params[:concert_id]
		@comment=@concert.comments.new comment_params
		
		if @comment.save
			flash[:notice] = "Comment Added"
			redirect_to concert_path(@concert)
		end
	end

	def index
		@concert=Concert.find params[:project_id]
		@comment= @concert.comments.all
	end
end

def comment_params
		params.require(:comment).permit(:author, :content)
end
