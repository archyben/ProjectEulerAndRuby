#!/usr/bin/env ruby

$num=String.new
$res=1
$res=1

0.upto(1_000_000) { |i|	$num << i.to_s}
0.upto(6) do |i|
	puts $num[10**i,1]
	$res*=$num[10**i,1].to_i
end

puts $res	
