class Direction
	def initialize(taille)
		@taille=taille
		@tab=Array.new(taille,0)
		@iter=-1
		@term=false
	end
	def virage
		@iter+=1
		return @tab[@iter]
	end
	def suiv
		@iter=-1
		i=0
		while i<@taille
			if @tab[i]==0
				@tab[i]=1
				break
			else 
				@tab[i]=0
				@term=true if i==19
				i+=1
			end
		end
	end
	def term
		return @term
	end
end

tri="75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23".split("\n").collect {|i| i.split}

a=0
haut=1
max=0
somme=tri[0][0].to_i

dir=Direction.new(tri.length)
until dir.term
	while haut<tri.length
		a+=dir.virage
		somme+=tri[haut][a].to_i
		haut+=1
	end
	max=somme if max<somme
	puts max
	somme=tri[0][0].to_i
	dir.suiv
	haut=1
	a=0
end
