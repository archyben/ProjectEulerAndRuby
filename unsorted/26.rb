#!/usr/bin/env ruby

maxv=0
maxc=0
2.upto(1000) do |i|
	pile=[]
	traitable=true
	n=0 #longueur du cycle
	d=10
	reste=d
	pile << reste
	loop do
		reste-=(reste/i)*i
		if reste==0
			traitable=false
			break
		end
		reste*=10
		break if pile.index(reste)!=nil
		pile << reste
	end
	n=pile.length-pile.index(reste) if traitable
	if maxc<n
		maxc=n
		maxv=i
	end
	puts "#{i} - #{n}" #{pile.inspect}"
end
puts maxc, maxv
