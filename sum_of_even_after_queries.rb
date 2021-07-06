def sum_of_even_after_queries(arr, queries)
  queries.map do |e|
    arr = arr.map.with_index do |e1, i|
      i == e[1] ? e1 + e[0] : e1
    end

    arr.select(&:even?).sum
  end
end

arr = [1, 2, 3, 4]
queries = [[1,0],[-3,1],[-4,0],[2,3]]
#p arr.select(&:even?).sum
p sum_of_even_after_queries(arr, queries) == [8,6,2,4]
