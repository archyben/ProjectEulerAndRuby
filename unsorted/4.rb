a=999
b=999

res=0
until a==100
	until b==100
		temp=a*b
		break if res>temp
		res=temp if temp.to_s==temp.to_s.reverse
		b-=1
	end
	b=999
	a-=1
end

puts res
