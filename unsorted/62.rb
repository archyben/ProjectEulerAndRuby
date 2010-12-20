require 'benchmark'

class Integer
    def each_cube(&bloc)
        tmp = self
        loop do
            bloc.call(tmp**3)
            tmp+=1
        end
    end
end

if __FILE__ == $0
	NB_PERMUTATIONS = 5
	hash = Hash.new
	1.each_cube do |cube|
    tmp = cube.to_s.split(//).sort.join
    if hash.has_key?(tmp)
        hash[tmp]<<(cube)
        if hash[tmp].size == NB_PERMUTATIONS
            puts hash[tmp].min
            exit
        end
    elsif
        hash[tmp]=[cube]
    end
	end
end
