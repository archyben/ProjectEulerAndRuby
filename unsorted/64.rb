def solve(maxi)
	2.upto(maxi) do |i|
		value -= (i**0.5).floor
		
	end
end

if __FILE__==$0
	solve(10000)
end
