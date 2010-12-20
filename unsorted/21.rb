#!/usr/bin/env ruby

hash={}
2.upto(1000) do |i|
	lim=i 	#limite de la boucle (racine)
	div=1 	#teste des diviseurs
	somme=0	#somme des divisuers 
	while div<lim
		if i%div==0
			somme+=div
			somme+=i/div unless div**2==i
			lim=i/div
		end
		div+=1
	end
	hash[i]=somme-i
end

puts hash.inspect
#nb=0
#hash.each_pair { |cle,valeur| nb+=cle if hash[valeur]!=nil && hash[valeur]==cle && cle!=valeur }

#puts nb
