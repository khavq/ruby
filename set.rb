require "set"
require "sorted_set"

set = SortedSet.new([2, 1, 5, 6, 4, 5, 3, 3, 3])
ary = []

set.each do |obj|
  ary << obj
end

p ary # => [1, 2, 3, 4, 5, 6]
