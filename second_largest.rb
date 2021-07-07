def second_largest(arr)
  return arr.first if arr.length == 1
  return arr.min if arr.length == 2
  first = second = -Float::INFINITY

  arr.each do |x|
    if x > first
      second = first
      first = x
    elsif x < first && x > second
      second = x
    end
  end

  second
end

p second_largest([1, 3, 4, 9, 5]) == 5
p second_largest([9, 3, 4, 9, 5]) == 5
p second_largest([1, 3]) == 1
p second_largest([1]) == 1
p second_largest([3, 3]) == 3

