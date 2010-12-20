#!/usr/bin/env ruby

class Integer
	def somme_digit
	    somme=0
		nombre=self
		until nombre==0
		    somme+=nombre%10
		    nombre/=10
		end
		return somme
	end
	
	def fact
		return (1..self).inject(1) {|somme,i| somme*i}
	end
end

puts 100.fact.somme_digit
