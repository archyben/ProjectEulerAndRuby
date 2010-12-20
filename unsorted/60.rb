class Integer
	def prime?
	  nb = self
		return true if nb==2
		return false if nb<2 or nb%2==0
		rac=Math.sqrt(nb)
		div=3
		while div <= rac
			return false if nb%div==0
			div+=2
		end
		return true
	end
	
	def each_prime(max,&bloc)
	min = self
	  if min%2==0
	    bloc.call(2) if min==2
	    min+=1
	  end
	  min.step(max,2) { |i|
	    bloc.call(i) if i.prime?
	  }
	  return nil
	end
end

def find_hash(max)
	primes = Array.new
	res = Hash.new
	0.each_prime(max) do |prime|
		primes << prime
		res[prime]=Array.new
    end
	primes.each do |prime1|
	puts prime1
		primes.each do |prime2|
			tmp1 = prime1.to_s
			tmp2 = prime2.to_s
			if (tmp1+tmp2).to_i.prime? and (tmp2+tmp1).to_i.prime?
				res[prime1] << prime2
			end
		end
	end
  return res
end

def resolve(max,n)
  hash = find_hash(max)
  array = hash.keys.map { |i| [i] }
  private_resolve(array,hash,n-1)
end


def private_resolve(array,hash,n)
  return array if n==0
  res = Array.new
  hash.each do |prime,values|
    puts prime
    array.each do |tab|
      next if tab.min<prime
      is_prime = true
      tab.each do |elem|
        unless values.include? (elem)
          is_prime = false
          break
        end
      end
      res << [prime]+tab if is_prime
    end
  end
  return [] if res.empty?
 	return private_resolve(res,hash,n-1)
end

if __FILE__==$0
	NB_ELEM = 5
	MAX = 10000
  val = resolve(MAX,NB_ELEM)
  unless val.empty?
  	puts val.inspect
	  puts val.map { |tab| tab.inject(0) { |sum,value| sum+value}}.min
  end
end
