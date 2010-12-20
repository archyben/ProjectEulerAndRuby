#!/usr/bin/env ruby

tab=[]

2.upto(9876) do |i|
	arret=false
	chiffres=[]
	dec=i
	until dec==0
		temp=dec%10
		if chiffres.index(temp)==nil
			chiffres << temp
			dec/=10
		else
			arret=true
			break
		end
	end
	next if arret
	2.upto(i-1) do |j|
		chiffres2=chiffres[0,chiffres.length]
		puts "#{i} #{j} #{chiffres.inspect}"
		dec=j
		until dec==0
			temp=dec%10
			if chiffres2.index(temp)==nil
				chiffres2 << temp
				dec/=10
			else
				arret=true
				break
			end
		end
		next if arret
		dec=i*j
		until dec==0
			temp=dec%10
			if chiffres2.index(temp)==nil
				chiffres2 << temp
				dec/=10
			else
				arret=true
				break
			end
		tab << i*j unless arret
		end
	end
end

puts tab.inspect
