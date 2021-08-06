def combination_sum2(candidates, target)
  candidates = candidates.select{|e| e<=target}

  candidates.map do |e|
  end
end

p combination_sum2([10,1,2,7,6,1,5], 8)# == [ [1,1,6], [1,2,5], [1,7], [2,6] ]
#p combination_sum2([2,5,2,1,2], 5)# == [ [1,2,2], [5] ]
