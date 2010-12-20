puts (1..1000).inject(0) { |i,j| i+(j**j) }.to_s[-10,10]
