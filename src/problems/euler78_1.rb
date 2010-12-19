#!/usr/local/bin/ruby
# coding: utf-8

# author:: Benjamin Perrard
# date:: 17 Décembre 2010

def main(max)
	matrix = Array.new
  matrix[0] = Array.new(1,0)
  i = 0
  loop do
    i+=1
    matrix[i] = Array.new(i+1,0)
		matrix[i][1]=1
    (i-1)/2.upto(i/2) do |value|
      matrix[value] = [matrix[value][-1]]
    end
		2.upto(i-1) do |j|
			matrix[i][j] = matrix[i][j-1]
      #puts "#{i} #{j} #{i-j}"
      #p matrix
      if i>2*j
        matrix[i][j] += matrix[i-j][j]
      else
        matrix[i][j] += matrix[i-j][-1]
      end
		end
    matrix[i][-1] = matrix[i][-2]+1
    p i
    return i if matrix[i][-1] % max == 0
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