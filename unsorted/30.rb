#!/usr/bin/env ruby

somme=0

0.upto(9) do |a|
	0.upto(9) do |b|
		0.upto(9) do |c|
			0.upto(9) do |d|
				0.upto(9) do |e|
					0.upto(9) do |f|
						nb=a*(10**5)+b*(10**4)+c*(10**3)+d*(10**2)+e*10+f
						if nb==a**5+b**5+c**5+d**5+e**5+f**5
							puts nb
							somme+=nb
						end
					end
				end
			end
		end
	end
end
					
					
puts "#{somme-1}"
