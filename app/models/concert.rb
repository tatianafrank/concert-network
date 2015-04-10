class Concert < ActiveRecord::Base
	has_many :comments

	validates :artist, presence:true
	validates :ticket_price, numericality: true
	validates :date, presence:true 
	validates :artist, length:{maximum:200}
	validates :venue, length:{maximum:200}
	validates :city, length:{maximum:50}
	validates :ticket_price, length:{maximum:7}

end
