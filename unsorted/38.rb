#!/usr/bin/env ruby

class Integer
	def pandprod
		mult=0
		nb=""
		res=""
		until res.length==9 and nb.empty?
			if nb.empty?
				mult+=1
				nb=(self*mult).to_s
			end 
			val=nb[0,1]
			return 0 if val.to_i==0 or res.include? val
			res << val
			nb=nb[1,nb.length-1]
		end
		return res.to_i
	end
end


$max=0

1.upto(9876) do |i|
	nombre=i.pandprod
	puts "#{i} - #{nombre}" unless nombre==0
	$max=nombre if nombre>$max
end

puts $max
