#!/usr/bin/env ruby

tab=nil #tableau de nom
somme=0 # somme totale

File.open("names.txt","r") { |i| tab=i.gets.strip.split(",").sort }

0.upto(tab.length-1) do |i|
	somlet=0
	tab[i].each_byte { |j| somlet+=j-64 if j>=65 && j<=90 }
	somme+=somlet*(i+1)
	puts "#{tab[i]} - #{somlet} - #{i} - #{somlet*(i+1)}"
end

puts somme
