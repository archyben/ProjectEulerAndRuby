#!/usr/bin/env ruby

a=1
b=1
n=2

while b<10**999
	a,b=b,a+b
	n+=1
end

puts n
