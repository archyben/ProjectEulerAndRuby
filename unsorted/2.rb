a=1
b=2
somme=0

while b<=4_000_000
	somme+=b if b%2==0
	a,b=b,a+b
	puts b
end

puts somme
