#!/usr/bin/env ruby

tab=[]

2.upto(100) do |i|
	tabtemp=[]
	2.upto(100) do |j|
		tabtemp << i**j
	end
	tab |= tabtemp
end

puts tab.length
