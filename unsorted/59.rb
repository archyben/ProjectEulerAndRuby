#!/usr/bin/env ruby

if __FILE__==$0
    $text = Array.new
	$table=File.read("cipher1.txt").strip.split(",")
	97.upto(122) do |i|
		97.upto(122) do |j|
		    97.upto(122) do |k|
		        $res=0
		        key=[i,j,k]
		        ($table.length).times do |index|
		            tmp = $table[index].to_i ^ key[index%3]
		            $res += tmp
		            $text[index]=tmp.chr
		        end
		        tmp = $text.join
		        if tmp=~/the /
		                 puts tmp
		                 puts
		                 puts "le résultat pour cette chaîne est #{$res}"
		                 puts "Appuyez sur une touche pour continuer la recherche"
		                 gets 
		        end
		    end
		end
	end
end
