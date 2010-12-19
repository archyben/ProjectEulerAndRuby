#!/usr/local/bin/ruby
# coding: utf-8

# author:: Benjamin Perrard
# date:: 17 Décembre 2010

def main(max)
	matrix = Array.new(max+1) {|i| Array.new(i,0) if i>0}
	2.upto(max) do |i|
		matrix[i][1]=1
		2.upto(i-1) do |j|
			matrix[i][j] = matrix[i][j-1]
      if i>2*j
        matrix[i][j] += matrix[i-j][j]
      else
        matrix[i][j] += matrix[i-j][-1]+1
      end
		end
	end
	return matrix[-1][-1]
end

if __FILE__==$0
  time_before = Time.now
	max = 100
  res = main(max)
  puts "Le résultat du problème 76 est #{res}\n"+ \
  	"Réalisé en #{Time.now - time_before} secondes"
end