#!/usr/bin/env ruby


def premier(x)
	return false if x%2==0 && x!=2
	mod=3
	rac=Math.sqrt(x)
	while mod<=rac
		return false if x%mod==0
		mod+=2
	end
	return true
end

puts Time.now
res=0
2.upto(2_000_000) do |c|
	res+=c if premier(c)
end

puts res
puts Time.now
