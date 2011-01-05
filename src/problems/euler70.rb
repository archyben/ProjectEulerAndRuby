#!/usr/local/bin/ruby
# coding: utf-8

# author:: Benjamin Perrard

require 'thread'
require "lib/my_combinatories"
require "lib/my_phi"
require "lib/my_primes"


############################################
############## ThreadFound70 ###############
############################################
class ThreadFound70
  def initialize(size, max, observer)
    @size = size
    @max = max
    @observer = observer
    @mutex = Mutex.new
  end

  def init
    puts "thread#{@size} : Début Init"
    @all_combination = Hash.new
    combination_with_prime(@size, @max) do |primes_number|
      @all_combination[primes_number] = get_n_to_phi(primes_number)
    end
    puts "thread#{@size} : Fin Init"
  end

  def process
    puts "thread#{@size} : Début Process"
    #puts @all_combination.keys.inspect()
    tmp = @all_combination.keys.sort_by {|i| @all_combination[i]}
    tmp.each do |primes_numbers|
      #puts "thread#{@size} : Vérif #{@observer.best_n_to_phi} #{@all_combination[primes_numbers]}"
      if (@observer.best_n_to_phi) && (@observer.best_n_to_phi< @all_combination[primes_numbers])
        break
      end
      phi = get_phi(primes_numbers)
      value = primes_numbers.inject(1) { |total,prime| total*prime }
      if is_permutation(value, phi)
        #puts "thread#{@size} : Valeur trouvé : #{primes_numbers} #{value} #{phi} #{value/phi.to_f} #{@all_combination[primes_numbers]}"
        @observer.set_value(value,@all_combination[primes_numbers])
      end
    end
    puts "thread#{@size} : Fin Process"
  end

  def run
    init()
    process()
    erase()
  end

  def erase
    @all_combination.clear
  end
end

############################################
################ Centralist ################
############################################
class Centralist
  attr_reader :best_n_to_phi, :best_value
  def initialize(max)
    @best_value = nil
    @best_n_to_phi = nil
    @threads = Array.new
    @mutex = Mutex.new

    2.upto(7) do |i|
      threadfound70 = ThreadFound70.new(i,max, self)
      @threads << Thread.new() do
        threadfound70.run
      end
    end

    @threads.each_index do |i|
      @threads[i].join
      @threads[i] = nil
    end
  end

  def set_value(value,n_to_phi)
    @mutex.synchronize do
      puts "Centralist : Début set_value"
      #puts "#{n_to_phi} #{@best_n_to_phi}"
      if (not @best_n_to_phi) or (n_to_phi < @best_n_to_phi)
        @best_value = value
        @best_n_to_phi = n_to_phi
      end
      puts "Centralist: current value -> #{@best_value} - #{@best_n_to_phi}"
    end
    puts "Centralist : Fin set_value"
  end
  
end

def main()
  time_before = Time.now
  max = (10**7)
  centralist=Centralist.new(max)
  res = centralist.best_value
  puts "Le résultat du problème 70 est #{res}\nRéalisé en #{Time.now - time_before} secondes"
end

if __FILE__==$0
  main
end
