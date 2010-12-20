def is_prime(integer):
	if nb==2:
		return True
	elif nb<2 or nb%2==0:
		return False
	rac = int(math.sqrt(integer))
	div=3
	while div <= rac:
		if nb%div==0:
			return False
		div+=2
	return True

def each_prime(mini,maxi):
	array = []
	if mini%2==0:
		if mini==2:
			array.append(2)
		mini+=1
	for i in xrange(mini,maxi,2):
		if is_prime(i):
			array.append(i)
	return array
	
def find_hash(maxi):
	primes = []
	res = {}
	for prime in each_prime(0,maxi):
		primes.append(prime)
		res[prime]=[]
	for prime1 in primes:
		for prime2 in primes:
			tmp1 = str(prime1)
			tmp2 = str(prime2)
			if is_prime(int((tmp1+tmp2)[::-1])) and is_prime(int((tmp2+tmp1)[::-1])):
				res[prime1].append(prime2)
			
		
	return res
	
def resolve(maxi,n):
	hash_tab = find_hash(maxi)
	array = map(lambda i: [i] , hash_tabmap.keys())
	private_resolve(array,hash_tab,n-1)
	
	private_resolve(array,hash_tab,n-1)
