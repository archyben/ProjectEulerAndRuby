def is_prime(value)
  return true if value == 2
  return false if value<2 or value%2==0
  3.step((Math.sqrt(value)+1).to_i,2) do |i|
    return false if value%i==0
  end
  return true
end

def next_prime(val)
  return 2 if val<2
  if val % 2 == 0
    value = val +1
  else
    value = val + 2
  end
  loop do
    if is_prime(value)
      return value
    end
    value += 2
  end
end

def combination_with_prime(size,max,&bloc)
  pos = size-1
  tab = Array.new(size,2)
  until pos == -1
    if tab.inject(1) {|total,value| total*value} > max
      pos -= 1
      next_pr = next_prime(tab[pos])
      pos.upto(size-1) do |i|
        tab[i] = next_pr
      end
    else
      bloc.call(tab.dup)
      pos = size-1
      tab[pos] = next_prime(tab[pos])
    end
  end
end

def each_prime_max(max_value,&bloc)
  bloc.call(2)
  3.stepto(max_value+1,2) do |i|
    bloc.call(i) if is_prime(i)
  end
end