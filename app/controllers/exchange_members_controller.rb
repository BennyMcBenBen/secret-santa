class ExchangeMembersController < ApplicationController

	def assign
		gifters = params[:names].split(",")
		giftees = gifters.shuffle
		@assignments = gifters.zip(giftees)
	end

	def update
	end

	def show
	end

end
