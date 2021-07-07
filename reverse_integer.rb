def reverse(num)
  even = num > 0 ? 1 : -1
  min_32bit_integer = -(1<<31)
  max_32bit_integer = (1<<31) - 1
  #p num
  #p min_32bit_integer
  #p max_32bit_integer
  return 0 if num < min_32bit_integer or num > max_32bit_integer

  a = []
  num = num > 0 ? num : num * (-1)
  while num > 0
    rem = num%10
    num = num/10
    a.push(rem)
  end
  #p a
  a.join().to_i * even
end

p reverse(123) == 321
p reverse(-123) == -321
p reverse(120) == 21
p reverse(0) == 0
p reverse(3147483648) == 0
p reverse(-3147483648) == 0
