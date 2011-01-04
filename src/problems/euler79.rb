#!/usr/bin/ruby
# coding: utf-8

def main(max)
	analyse_list = Hash.new
	numbers_list = Array.new
	all_digits = Array.new
	File.open("keylog.txt","r") do |file|
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
	p analyse_list
	return
end

if __FILE__==$0
	max = 3
	puts main(max)
end