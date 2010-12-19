#!/usr/bin/env ruby
# coding: utf-8

require "lib/phi"
require "lib/primes"

def main(max)
	prime_wire = Array.new
	1.upto(((max/2)**0.5).to_i) do |p|
		q = 2-((p+1)%2)
		while ((tmp = 2*((p**2)+(p*q))) < max) and (q<p)
			if p.gcd(q) == 1
				prime_wire << tmp
			end
			q+=2
		end
	end
	res_list = Array.new(max+1,nil)
	prime_wire.each do |wire|
		wire.step(max,wire) do |m_wire|
			if res_list[m_wire] == nil
				res_list[m_wire] = true
			else
				res_list[m_wire] = false
			end
    end
  end
  return (res_list.select { |i| i }).size
end

if __FILE__==$0
  time_before = Time.now
	max = 1_500_000
  res = main(max)
  puts "Le résultat du problème 75 est #{res}\nRéalisé en #{Time.now - time_before} secondes"
end