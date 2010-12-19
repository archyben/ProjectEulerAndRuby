def is_permutation(val1,val2)
  val1.to_s.split(//).sort == val2.to_s.split(//).sort
end