#!/usr/bin/env ruby

a=1
b=1

while true
	c=Math.sqrt(a**2+b**2)
	if a+b+c==1000
		puts a*b*c.to_i
		break
	elsif a+b+c>=1000
		b=1
		a+=1
	else
		b+=1
	end
end
