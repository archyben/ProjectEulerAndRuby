#!/usr/bin/env ruby

$hash=Hash.new

1.upto(999) do |i|
	1.upto(i) do |j|
		hyp=((i**2)+(j**2))**0.5
		p=(i+j+hyp).to_i
		break if p>999
		next if hyp.to_i!=hyp
		if $hash.include? p
			$hash[p]+=1
		else
			$hash[p]=1
		end
	end
end

$res=nil
$max=0

$hash.each_key do |cle|
	if $hash[cle]>$max
		$res=cle
		$max=$hash[cle]
	end
end

puts $res, $max
