class Garage
	
	def initialize(slots)
		@slots = Array.new(slots.to_i) { |i| }
	end

	def park(car)
		@slots.each_with_index do |slot, index|
			if(slot == nil)
				@slots[index] = car
				return index
			end 
		end
		return -1
	end

end

