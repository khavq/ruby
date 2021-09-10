def swap(a, i, j)
  a[i], a[j] = a[j], a[i]
  a
end

def partition(arr, left, right)
  pivot = arr[right]
  i = left - 1

  for j in (left..right - 1) do
    if arr[j] < pivot
      i = i + 1
      swap(arr, i, j)
    end
  end

  swap(arr, ( i + 1 ), arr[right])
  puts "i: #{i + 1} --- arr: #{ arr.inspect }"

  return ( i + 1 )
end

def quick_sort(arr, left, right)
  if left < right
    pi = partition(arr, left, right)
    quick_sort(arr, left, pi - 1)
    quick_sort(arr, pi + 1, right)
  end
end

a = [1,4,5,2,0]
puts "a: #{ a.inspect }"
quick_sort(a, 0, a.size - 1)
puts "quick sort: a: #{ a.inspect }"