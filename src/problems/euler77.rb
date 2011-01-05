#!/usr/local/bin/ruby
# coding: utf-8

# author:: Benjamin Perrard
# date:: 18 Décembre 2010

require 'lib/my_primes'

def main(max)
	matrix = Array.new
  i = 0
  loop do
    i+=1
    matrix[i] = Array.new(i,0)
    primes = Array.new(1,0)
    next if i<4
    while (j = next_prime(primes[-1])) < i do
      primes << j
			matrix[i][j] = matrix[i][primes[-2]]
      if i>2*j
        matrix[i][j] += matrix[i-j][j]
      else
        matrix[i][j] += ([0]+matrix[i-j].select { |value| value != 0 })[-1] + (is_prime(i-j) ? 1 : 0)
      end
      return i if matrix[i][j] >= max
    end
  end
end

if __FILE__==$0
  time_before = Time.now
	max = 5_000
  res = main(max)
  puts "Le résultat du problème 77 est #{res}\n"+ \
  	"Réalisé en #{Time.now - time_before} secondes"
end