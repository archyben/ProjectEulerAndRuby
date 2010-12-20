class Integer
	def fact
		return (2..self).inject(1) {|somme,i| somme*i}
	end
end

list=Array.new(10,false)
val=9
suite=0

until val<0
	9.downto(0) { |i| temp=i if list[i]==false }
	0.upto(9) do |i|
		if list[i]==false
			if val.fact+suite<1_000_000
				suite+=val.fact
				puts suite
			else
				puts i
				list[i]=true
				val-=1
				break
			end
		end
	end
end

