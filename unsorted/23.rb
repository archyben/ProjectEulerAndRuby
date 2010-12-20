#!/usr/bin/env ruby

temps=Time.now
somme=(1..23).inject(0) { |a,b| a+b }
nbabondant=Array.new(28124,false)

def abondant(val)
	lim=val 	#limite de la boucle (racine)
	div=1 		#teste des diviseurs
	somme=0		#somme des divisuers 
	while div<lim
		if val%div==0
			somme+=div
			somme+=val/div unless div**2==val
			lim=val/div
		end
		div+=1
	end
	return val<(somme-val)
end

12.upto(28123-12) do |i|
	nbabondant[i]=abondant( i )
end

25.upto(28123) do |i|
	bool=true
	12.upto(i/2) do |j|
		if nbabondant[j] && nbabondant[i-j]
			bool=false
			break
		end
	end
	somme+=i if bool
end

puts "realise en #{(Time.now-temps).to_i} seconde(s)"
puts "le resultat est #{somme}"
