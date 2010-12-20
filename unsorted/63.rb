

if __FILE__==$0
	res = 0
	pow = 0
	while 9**pow > 10**(pow-1) do
		nb = 1
		tmp=0
		while tmp<10**pow
			tmp = nb**pow
			if tmp.to_s.size == pow
				res+=1
			end
			nb+=1
		end
		
		pow+=1
	end
	puts pow
	puts res
end
