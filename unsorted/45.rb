#!/usr/bin/env ruby

class Integer
    def triangle
        self*(self+1)/2
    end
    
    def pentagonal
        self*((3*self)-1)/2
    end
    
    def hexagonal
        self*((2*self)-1)
    end
end

$tn = 1
$pn = 1
$hn = 1

loop do
    i=$tn.triangle
    j=$pn.pentagonal
    k=$hn.hexagonal
    
    if i==j and j==k
        puts "**** #{i}"
        $tn+=1
    elsif i==[i,j,k].min
        $tn+=1
    elsif j==[i,j,k].min
        $pn+=1
    else
        $hn+=1
    end
end
