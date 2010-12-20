class Integer
	def premier?
		nb=self
		return false if nb<2
		return false if nb%2==0		
		rac=Math.sqrt(nb)
		div=3
		while div <= rac
			return false if nb%div==0
			div+=2
		end
		return true
	end
end

maxv=0
amax=nil
bmax=nil

-999.upto(999) do |a|
	-999.upto(999) do |b|
		n=0
		n+=1 while ((n**2) + (a*n) + b).premier?
		if n>maxv
			amax=a
			bmax=b
			maxv=n	
		end
	end
end

puts amax*bmax, amax, bmax, maxv
