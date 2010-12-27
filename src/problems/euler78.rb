#!/usr/bin/ruby
# coding: utf-8

# author:: Benjamin Perrard
# date:: 27 Décembre 2010

def pent(value)
	(value * (3*value-1)) / 2
end

def main(max)
	matrix = Array.new
  matrix[0] = 1
  i = 0
  loop do
    i+=1
    matrix[i] = 0
    sens = 1
    value = 1
    while true
    	tmp = i-(pent(value * sens))
    	#puts "#{i} #{tmp} #{sens} #{value}"
    	break if tmp < 0
    	matrix[i] += ( value % 2 == 0 ? -1 : 1) * matrix[tmp]
    	if sens == -1
    		value += 1
    	end
    	sens *= -1
    end
    matrix[i] = matrix[i] % max
    #p matrix
    return i if matrix[i] == 0
	end
end

if __FILE__==$0
  max = 1_000_000
  time_before = Time.now
  res = main(max)
  puts "Le résultat du problème 78 est #{res}\n"+ \
  	"Réalisé en #{Time.now - time_before} secondes"
end
