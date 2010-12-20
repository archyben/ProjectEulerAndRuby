#/usr/bin/env ruby

class Integer
	def premier?
		return true if self==2
		return false if self%2==0 or self<2
		nb=self
		lim=(nb**0.5)+1
		3.step(lim,2) { |div| return false if nb%div==0 }
		return true
	end
	def pandigital?
		nb=self.to_s
		tab=[]
		lim=nb.length
		nb.each_byte do |i|
			chiffre=i.chr.to_i		
			return false if tab.include?(chiffre) or chiffre>lim or chiffre==0
			tab << chiffre 
		end
		return true
	end
end
	
7654321.step(3,-2) do |i|
	if i.pandigital? and i.premier?
		puts i
		break
	end
end
