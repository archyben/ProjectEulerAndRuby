#!/usr/bin/env python3

from itertools import combinations
from itertools import permutations

if __name__=="__main__":
	N=5
	all_possibilities = []
	
	combinations_iter = combinations(map(lambda x: x+1, range(2*N)),N)
	combinations_set = map(lambda x:set(x),combinations_iter)
	for int_values in combinations_set:
		ext_values = int_values ^ set(map(lambda x: x+1, range(2*N)))
		int_values_permut = list(permutations(int_values))
		ext_values_permut = list(permutations(ext_values))
		
		for int_value in int_values_permut:
			for ext_value in ext_values_permut:
				if min(ext_value)!=ext_value[0]:
					continue
				the_sum = None
				for index in range(N):
					the_sum_tmp = int_value[index] + \
					int_value[(index+1)%N] + \
					ext_value[index]
					if the_sum == None:
						the_sum = the_sum_tmp
						continue
					elif the_sum != the_sum_tmp:
						the_sum = None
						break
				if the_sum != None:
					possibility = []
					for index in range(N):
						possibility.append(\
							str(ext_value[index]) + \
							str(int_value[index]) + \
							str(int_value[(index+1)%N]))
					possibility = "".join(possibility)
					all_possibilities.append(possibility)
	
	print(max(all_possibilities))				