#!/usr/bin/env ruby

somme=1
spi=1001

3.step(spi,2) do |i|
	somme+=i**2
	puts i**2	
end

3.step(spi,2) do |i|
	somme+=(i**2)-i+1
	puts (i**2)-i+1	
end

3.step(spi,2) do |i|
	somme+=(i**2)-2*(i-1)
	puts (i**2)-2*(i-1)	
end

3.step(spi,2) do |i|
	somme+=(i**2)-3*(i-1)
	puts (i**2)-3*(i-1)	
end

puts somme
