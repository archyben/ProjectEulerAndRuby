class Integer
	def triangle
		self*(self-1)/2
	end

	def square
		self**2
	end

	def pentagonal
		self*(3*self-1)/2
	end

	def hexagonal
		self*(2*self-1)
	end

	def heptagonal
		self*(5*self-3)/2
	end

	def octagonal
		self*(3*self-2)
	end
	
	def fusional?(other_number)
		return (self%100 == other_number/100)
	end

	def find_number(hash)
		res = Array.new
		hash.each do |key,values|
			res << key if values.include?(self)
		end
		return res
	end
end

class Array

	def all_type?(n)
		res = Array.new(self.inject(1) {|sum,tab| sum*tab.size})
		0.upto(res.size-1) {|i| res[i] = Array.new}
		self.each do |values|
			iter = 0
			res.each do |tab|
				tab << values[iter] unless tab.include? values[iter]
				iter = (iter+1)%(values.size)
			end
		end
		res.each do |i|
			return true if i.size==n
		end
		return false
	end
	
end

if __FILE__==$0
	hash = Hash.new
	hash[:triangle] = Array.new
	hash[:square] = Array.new
	hash[:pentagonal] = Array.new
	hash[:hexagonal] = Array.new
	hash[:heptagonal] = Array.new
	hash[:octagonal] = Array.new

	i = 0
	loop do
		i+=1
		tmp = i.triangle
		next if tmp < 1000
		break if tmp > 9999
		hash[:triangle] << tmp
	end

	i = 0
	loop do
		i+=1
		tmp = i.square
		next if tmp < 1000
		break if tmp > 9999
		hash[:square] << tmp
	end

	i = 0
	loop do
		i+=1
		tmp = i.pentagonal
		next if tmp < 1000
		break if tmp > 9999
		hash[:pentagonal] << tmp
	end

	i = 0
	loop do
		i+=1
		tmp = i.hexagonal
		next if tmp < 1000
		break if tmp > 9999
		hash[:hexagonal] << tmp
	end

	i = 0
	loop do
		i+=1
		tmp = i.heptagonal
		next if tmp < 1000
		break if tmp > 9999
		hash[:heptagonal] << tmp
	end

	i = 0
	loop do
		i+=1
		tmp = i.octagonal
		next if tmp < 1000
		break if tmp > 9999
		hash[:octagonal] << tmp
	end
  
  	all_number = hash.values.flatten.uniq
  	possible_values = Hash.new
  	
  	new_hash = Hash.new
  	
  	all_number.each do |number1|
  		new_hash[number1]=Array.new
  		all_number.each do |number2|
  			if number1.fusional?(number2)
  				new_hash[number1] << number2
  			end
  		end
  	end

  	
	size = all_number.size

=begin
	0.upto(size-1) do |i|
		(i+1).upto(size-1) do |j|
			(j+1).upto(size-1) do |k|
				(k+1).upto(size-1) do |l|
					(l+1).upto(size-1) do |m|
						(m+1).upto(size-1) do |n|
		
						end		
					end		
				end
			end		
		end
	end
=end
	all_type = Array.new
	hash[:octagonal].each do |i|
		new_hash[i].each do |j|
			new_hash[j].each do |k|
				new_hash[k].each do |l|
					new_hash[l].each do |m|
						new_hash[m].each do |n|
							if n.fusional?(i)# all_type.flatten.uniq.size == 6

							
								tab = [i.find_number(hash),j.find_number(hash),k.find_number(hash),l.find_number(hash),m.find_number(hash),n.find_number(hash)]
								if tab.all_type?(hash.size)
									puts tab.inspect
									puts [i,j,k,l,m,n].inspect					
									puts [i,j,k,l,m,n].inject(0) {|sum,value| sum+value}
								end
							end
						end
					end
				end
			end
		end
	end
end
