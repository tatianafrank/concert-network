class ConcertsController < ApplicationController
	def home
		@concerts_this_month=Concert.where("date >= ? AND date <= ?", 
			DateTime.now, Date.today.end_of_month) 
		render 'home'
	end
	def new
		@concert=Concert.new
	end

	def create
		@concert=Concert.new concert_params
		@concerts=Concert.all
		if @concert.save
			flash[:notice] = "Concert Added Successfully"
			redirect_to action: 'index', controller:'concerts', concert_id: @concert.id
		else 
			render 'new'
		end
	end

	def index
		@concerts=Concert.all
		if @concerts.empty?
			render 'no_concerts'
		else
			render 'index'
		end
	end

	def show
		begin
		@concert=Concert.find params[:id]
		rescue ActiveRecord::RecordNotFound
	  	render 'no_concerts'
	  	end
	  	@comment=@concert.comments.new 
		@comments=@concert.comments.all
	end

	

	def concert_params
		params.require(:concert).permit(:artist, :city, :date, :venue, :description, :ticket_price)
	end

end
