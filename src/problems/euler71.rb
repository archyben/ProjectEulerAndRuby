#!/usr/local/bin/ruby
# coding: utf-8

require "lib/my_phi"
require "lib/my_primes"
require "lib/my_frac"

def main(max)
	puts "Début initialisation..."
	decomposed_numbers_list = Array.new(max)
	decomposed_numbers_list[1] = [].freeze
	1.upto(Math::log(max,2).to_i) do |i|
		combination_with_prime(i,max) do |dec_number|
			decomposed_numbers_list[dec_number.inject(1) \
				{ |total,val| total * val}] =	dec_number.freeze
		end
	end
	puts "Fin initialisation..."
	puts "Début Process..."
	res = Frac.new(1,max)
	ref = Frac.new(3,7).freeze
	max.downto(1) do |value|
		tmp = Frac.new((res.num*value) / res.den,value)
		while tmp.inc_num < ref
			tmp.inc_num!
			next unless (decomposed_numbers_list[tmp.num] & \
				decomposed_numbers_list[tmp.den]).empty?
			if res < tmp
				res = tmp.dup
			end
		end
	end
	puts "Fin Process..."
	return res.num
end 

if __FILE__==$0
  time_before = Time.now
	max = 10**6
  res = main(max)
  puts "Le résultat du problème 71 est #{res}\nRéalisé en #{Time.now - time_before} secondes"
end