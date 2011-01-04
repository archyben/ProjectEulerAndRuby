#!/usr/bin/ruby
# coding: utf-8

# author:: Benjamin Perrard
# date:: 17 Décembre 2010
# comment::  Too long !!!!

def main(max)
	matrix = Array.new
  matrix[0] = Array.new(1,0)
  i = 0
  loop do
    i+=1
    matrix[i] = Array.new(i+1,0)
		matrix[i][1]=1
		actual_value = 0
		(i-1).downto(1) do |j|
			#p "#{i} #{j}"
			#p matrix
      matrix[j].delete_at(0) unless matrix[j].size == 1
      actual_value = (actual_value + matrix[j][0]) % max
      matrix[i][i-j] = actual_value
		end
    matrix[i][-1] = matrix[i][-2]+1
    p i
    #p matrix
    return i if matrix[i][-1] == max
	end
end

if __FILE__==$0
  max = 1_000_000
  #max = 7
  time_before = Time.now
  res = main(max)
  puts "Le résultat du problème 78 est #{res}\n"+ \
  	"Réalisé en #{Time.now - time_before} secondes"
end