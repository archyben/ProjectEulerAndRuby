#!/usr/bin/env ruby
piece=[0,1,2,5,10,20,50,100,200]

mat=Array.new(9) { |i| i=Array.new(201,0) }

mat[0].each { |i| i=0 }
mat.each { |i| i[0]=1 }
mat[0][0]=nil

1.upto(8) do |i|
	1.upto(200) do |j|
		if j-piece[i]>=0
			mat[i][j]=mat[i][j-piece[i]]+mat[i-1][j]
		else
			mat[i][j]=mat[i-1][j]
		end
	end
end

				
puts mat.inspect
