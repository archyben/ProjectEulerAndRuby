#!/usr/bin/env ruby

sunday=8
tab=[31,28,31,30,31,30,31,31,30,31,30,31]
nb=0

def leap?(annee)
	return true if annee%400==0
	return false if annee%100==0
	return true if annee%4==0
	return false
end

1900.upto(2000) do |an|
	tab.each do |i|
		if i==28 && leap?(an) 
			sunday=(sunday+29)%7
		else
			sunday=(sunday+i)%7
		end
		nb+=1 if an!=1900 && sunday==0
	end
end

puts nb
		
