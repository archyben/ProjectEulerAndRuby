require 'mathn'
puts "Started at #{Time.now}."
sum = Prime.new.inject(0) { |sum, n|
  break sum unless n < 2_000_000
  sum + n
}
puts "Finished at #{Time.now}."
puts "Sum is #{sum}."
