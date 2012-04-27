# Class Bids - created for ruby challange one
# accept_bids is a method of Bids which will take in a list
# of bids and the number of servers with which to allocate
# If bid list is not given or the number of servers given is 
# less than zero no bids will be accepted.

class Bids 
	def accept_bids(bidList, numberOfServers)
		bids 			= []
		accepted_bids	= []
		currentPrice    = 0
		bidNumber		= 1

		if !bidList.nil?
			bids 			= bidList.split(',').map{|b|b.to_i}
		end

		#  iterate through proposed bids and stop when when either all 
		#  the servers have been allocated or the price point has bee set.
		bids.each do|bid|
				currentBid = bid * bidNumber
				if bidNumber > numberOfServers.to_i
					break
				elsif currentBid < currentPrice
					break	
				end
				# Set bids and increment locals
				accepted_bids << bid
				currentPrice = bid * bidNumber
				bidNumber += 1
		end	
		return accepted_bids
	end

	#require File.expand_path("bids")
	bids = Bids.new
	accepted_bids=[]
	input_bids = ARGV[0]
	servers = ARGV[1].to_i
	accepted_bids = bids.accept_bids(input_bids, servers)

	puts "\n"
	puts "Number Of Servers Available: #{servers} " 
	puts "Number of Bids Accepted: #{accepted_bids.size}"
	if accepted_bids.size > 0
		puts "Price Point: $#{accepted_bids.last}" 
		puts "Accepted Bids:"
		accepted_bids.each do|b| puts "	$" + b.to_s end
	end	
end;

