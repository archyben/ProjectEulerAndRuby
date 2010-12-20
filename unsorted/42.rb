#!/usr/bin/env ruby

$tab=nil
$nbtri=0

class Integer
	def triangle_number?
		nb=self
		pas=2
		val=1
		while nb>val
			val+=pas
			pas+=1
		end
		return true if nb==val
		return false
	end
end


File.open("words.txt","r") { |i| $tab=i.gets.strip.delete("\"").split(",") }

$tab.each do |mot|
	val=0
	mot.each_byte { |lettre| val+=lettre-64 }
	$nbtri+=1 if val.triangle_number?
end

puts $nbtri		
