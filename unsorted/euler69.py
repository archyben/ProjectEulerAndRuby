#!/usr/bin/env python3

from fractions import gcd
from itertools import combinations

def is_prime(value):
	for it in range(3,int(pow(value,0.5))+1,2):
		if value % it == 0 : return False
	return True

def each_prime(max_value):
	if max_value < 2: return
	yield 2
	for i in range(3,max_value,2):
		if is_prime(i): yield i 
	

if __name__ == "__main__":
	MAX = 1000000
	
	max_prime_divisor = 0
	value = 1
	tab_primes1 = []
	for i in each_prime(MAX):
		tmp = value * i
		if tmp > MAX:
			break
		else:
			tab_primes1.append(i)
			value = tmp
			max_prime_divisor +=1
	
	tmp = 1
	for i in tab_primes1[:-1]:
		tmp *= i
		
	tab_primes2 = []
	for i in each_prime(MAX):
		if tmp * i > MAX:
			break
		tab_primes2.append(i)
	
	
	list_of_prime = combinations(tab_primes2,max_prime_divisor)
	#print(list(list_of_prime))
	result = []
	for item in list_of_prime:
		tmp = 1
		for it in item:
			tmp *= it
			if tmp > MAX:
				break
		if tmp <= MAX: result.append(tmp)
	
	result2 = {}
	for i in result:
		tmp = 0
		for j in range(i):
			if gcd(i,j) == 1:
				tmp +=1
		result2[i] = float(i)/tmp
		
	final_result = 0
	final_result_tmp = 0
	for i in result2.keys():
		if final_result_tmp < result2[i]:
			final_result_tmp = result2[i]
			final_result = i
		
	print(final_result)
