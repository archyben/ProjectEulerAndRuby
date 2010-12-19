#!/usr/local/bin/ruby
# coding: utf-8

# author:: Benjamin Perrard

require "euler/lib/integer_add"

def sum_factorial(value)
	tmp = 0
	value.to_s.each_byte do |byte|
		tmp += byte.chr.to_i.fact
	end
	return tmp
end

def main(max)
	res = 0
	dictionnary = Array.new
	1.upto(max) do |value|
		tmp_value = value
		all_values = Array.new
		loop do
			if all_values.include?(tmp_value)
				puts "#{value} - #{all_values.size}"
				if all_values.size == 60
					res+=1
				end
				break
			end
			
			all_values << tmp_value
			tmp_value = sum_factorial(tmp_value) 
		end
	end
	puts dictionnary[1454]
	puts dictionnary[69]
	puts dictionnary[78]
	return res
end

if __FILE__==$0
  time_before = Time.now
	max = 10**6
  res = main(max)
  puts "Le résultat du problème 74 est #{res}\n"+ \
  	"Réalisé en #{Time.now - time_before} secondes"
end
