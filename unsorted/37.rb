class Integer
	def cesure
		tab=[]
		nb=self
		until nb==0
			tab << nb
			nb/=10
		end
		nb=self.to_s
		until nb.length==1
			nb=nb[1,nb.length-1]
			tab << nb.to_i
		end
		return tab
	end
	def premier?
		return true if self==2
		return false if self%2==0 or self<2
		nb=self
		lim=(nb**0.5)+1
		3.step(lim,2) { |div| return false if nb%div==0 }
		return true
	end 
end

$nb_trouve=0
$res=0
nb=11

until $nb_trouve==11
	if nb.cesure.inject(true) { |res,val| res and val.premier? }
		puts nb
		$res+=nb
		$nb_trouve +=1
	end
	nb+=1
end

puts $res
