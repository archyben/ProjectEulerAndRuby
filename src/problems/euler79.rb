#!/usr/bin/ruby
# coding: utf-8

def main(max)
	analyse_list = Hash.new
	numbers_list = Array.new
	all_digits = Array.new
	File.open("flat_files/euler79_keylog.txt","r") do |file|
		file.each_line do |line|
			numbers_list << line.strip.split(//).collect { |i| i.to_i }
		end
	end
	numbers_list.each do |number|
		0.upto(max-1) do |i|
			tmp = number[i].to_i
			unless all_digits.include? (tmp)
				all_digits << tmp 
				analyse_list[tmp] = Array.new
			end
			analyse_list[tmp] = (analyse_list[tmp] + number[i+1, max - i -1]).uniq
		end
	end
	res = Array.new
	size = analyse_list.size
	analyse_list.each_key do |key|
		res[size - analyse_list[key].size] = key
	end
	return res.join
end

if __FILE__==$0
time_before = Time.now
	max = 3
	res = main(max)
	puts "Le résultat du problème 79 est #{res}\n"+ \
  	"Réalisé en #{Time.now - time_before} secondes"
end