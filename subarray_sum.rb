def subarray_sum(arr, sum)
  s=0
  arr.map.with_index do |e, i|
    break i if s == sum
    s += e
  end
end
arr = (1..3).to_a
p subarray_sum(arr, 3)
