#!/usr/bin/env ruby

def trouv(somme,val)
	nbdiv=0
	lim=somme
	div=1
	while div<lim
		if somme%div==0
			unless div**2==somme
				nbdiv+=2
				lim=somme/div
			else
				nbdiv+=1
				lim=div
			end
		end
		return true if nbdiv>val
		div+=1
	end
	return false
end

temps=Time.now.to_i
nomb=1
somme=0
loop do
	somme+=nomb
	break if trouv(somme,500)
	nomb+=1
end


puts somme
temps=Time.now.to_i-temps
puts "calcul réalisé en #{temps} seconde(s)"
