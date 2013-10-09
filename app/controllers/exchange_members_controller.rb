class ExchangeMembersController < ApplicationController

	class Assignment
		attr_accessor :gifter, :giftee
	end

	def assign
		gifters = params[:names].split(",")

		# naive implementation
		# giftees = gifters.rotate

		@assignments = pick_names_from_hat(gifters)
	end

	def pick_names_from_hat(gifters)
		assignments = Array.new
		hat = gifters.clone
		queue = gifters.clone

		while !queue.empty?
			# pick a name from the hat
			gifter = queue.pop
			giftee = pick_name_from_hat(gifter, hat)

			assignment = Assignment.new
			assignment.gifter = gifter
			assignment.giftee = giftee

			assignments.push(assignment)
		end

		return assignments
	end

	def pick_name_from_hat(gifter, hat)
		giftee = nil
		if hat.length == 1
			# Pick the last one, even if it's for yourself
			giftee = hat.pop
			puts "gifter=#{gifter}, giftee=#{giftee}"
		else
			while giftee == nil
				hat.shuffle!
				name = hat.pop
				puts "gifter=#{gifter}, hat=#{hat}, name=#{name}"
				if name == gifter	
					hat.push(name)
					puts "redraw name from hat!"
				else
					giftee = name
				end
			end

		end
		return giftee
	end

	def update
	end

	def show
	end

end
