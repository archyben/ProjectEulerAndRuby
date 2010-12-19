class Frac
  attr_accessor :num, :den
  
  def initialize(num,den)
    @num=num
    @den=den
  end
  
  def ==(other_frac)
     @den*(other_frac.num) == @num*(other_frac.den)
  end
  
  def <(other_frac)
    if pos?
      if other_frac.pos?
        return @den*(other_frac.num) > @num*(other_frac.den)
      else
        return false
      end
    else
      if other_frac.pos?
        return true
      else
        return @den*(other_frac.num) < @num*(other_frac.den)
      end
    end
  end
  
  def <=(other_frac)
    self<other_frac or self==other_frac
  end
  
  def >=(other_frac)
    not self<other_frac
  end
  
  def >(other_frac)
    not self<=(other_frac)
  end

  def pos?
    not (@num<0) ^ (@den<0)
  end
  
  def <=>(other_frac)
    return -1 if self<other_frac
    return 1 unless self<other_frac
    return 0
  end
  
  def to_s
    "(#{@num}/#{@den})"
  end
  
  def inspect
    return to_s
  end
  
  def to_a
    [@num,@den]
  end
  
  def to_f
    return @num/(@den.to_f)
  end
  
  def inc_num!
    @num+=1
    return
  end
  
  def inc_den!
    @den+=1
    return
  end
  
  def dec_num!
    @num-=1
    return
  end
  
  def dec_den!
    @den-=1
    return
  end
  
  def inc_num
    return Frac.new(@num+1,@den)
  end
  
  def inc_den
    return Frac.new(@num,@den+1)
  end
  
  def dec_num
    return Frac.new(@num-1,@den)
  end
  
  def dec_den
    return Frac.new(@num,@den-1)
  end
end