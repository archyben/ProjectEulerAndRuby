#!/usr/bin/env ruby
class Integer
	def premier?
		return false if self%2==0 && self!=2
		mod=3
		rac=Math.sqrt(self)
		while mod<=rac
			return false if self%mod==0
			mod+=2
		end
		return true
	end
	
	def carre?
	    self == ((self**0.5).floor)**2
	end
end

$un = 3
$deux = 3
$nbPremier=Array.new


def ajoutPremier(val)
    max=1 unless max=$nbPremier.max
    (max+2).step(val-2,2) do |i|
        $nbPremier << i if i.premier?
    end
end

loop do
    while $deux<=$un
        val = $un * $deux
        ajoutPremier(val)
        bool = false
        $nbPremier.each do |i|
            break if i > val
            tmp=(val - i)/2
            if tmp.carre?
                bool = true
                break
            end
        end
        unless bool
            puts val
            exit
        end
        $deux+=2
    end
    $un+=2
    $deux=3
end
