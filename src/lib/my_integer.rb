class Integer
	def fact
		(2..self).inject(1) { |total,value| total * value}
	end
	
	def pent
		(self * (3*self-1)) / 2
	end
end
