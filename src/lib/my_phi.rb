def get_phi(primes_number)
  phi = 1
  for value in primes_number.uniq
    nb_value = primes_number.count(value)
    phi *= (value-1)*(value**(nb_value-1))
  end
  return phi
end

def get_n_to_phi(primes_numbers)
  uniq_primes_numbers = primes_numbers.uniq
  uniq_primes_numbers.inject(1) { |total,prime| total*(prime/(prime-1).to_f) }
end