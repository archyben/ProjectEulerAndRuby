#!/usr/bin/env ruby

unit=[0,3,3,5,4,4,3,5,5,4]
unitp=[3,6,6,8,8,7,7,9,8,8]
diz=[6,6,5,5,5,7,6,6]
cent=7
et=3

somme=0

unit.each do |k|
	if k==0
		unit.each { |i| somme+=(i)}
		unitp.each { |i| somme+=(i)}
		diz.each do |i|
			unit.each { |j| somme+=(i+j)}
		end
	else
		unit.each do |i|
			if i==0
				somme+=(k+cent)
			else
				somme+=(k+cent+et+i)
			end
		end
		unitp.each { |i| somme+=(i+k+cent+et)}
		diz.each do |i|
			unit.each { |j| somme+=(i+j+k+cent+et)}
		end
	end
end

somme+=11
puts somme
