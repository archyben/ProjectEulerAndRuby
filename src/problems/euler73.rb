#!/usr/local/bin/ruby
# coding: utf-8

require "euler/lib/phi"
require "euler/lib/primes"
require "rational"

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
	decomposed_numbers_list.freeze
	puts "Fin initialisation..."
	puts "Début Process..."
	res = 0
	2.upto(max) do |den|
		(den.fdiv(3).ceil).upto(den.fdiv(2).floor) do |num|
			next if num<2
			if (decomposed_numbers_list[den] & decomposed_numbers_list[num]).empty?
				res+=1
			end
		end
	end
	
	puts "Fin Process..."
	return res
end 

if __FILE__==$0
  time_before = Time.now
	max = 12_000
  res = main(max)
  puts "Le résultat du problème 73 est #{res}\nRéalisé en #{Time.now - time_before} secondes"
end
