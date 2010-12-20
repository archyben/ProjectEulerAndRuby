def dec(b)
	if b%2==0
		puts 2
		return dec(b/2)
	end
	iter=3
	rac=Math.sqrt(b)
	while iter<=b
		if b%iter==0
			puts iter
			return dec(b/iter)
		end
		iter+=2
	end
	return nil
end

a=6008514751438
dec(a)
