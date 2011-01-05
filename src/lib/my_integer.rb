class Integer
	def fact
		(2..self).inject(1) { |total,value| total * value}
	end
end
