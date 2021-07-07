#!/usr/bin/ruby

def swap(a, i)
  ai = a[i]
  a[i] = a[i-1]
  a[i-1] = ai
  a
end

def bigger_is_greater(s)
  o ||= s
  i = s.length - 1
  while (s = swap(s.chars, i).join()) < o
    i -= 1
  end
  if s > o
    s
  else
    ""
  end
end

p bigger_is_greater("ab") == "ba"
p bigger_is_greater("bb") == ""
p bigger_is_greater("hefg") == "hegf"
p bigger_is_greater("dhck") == "dhkc"
p bigger_is_greater("dhck") == "dhkc"
p bigger_is_greater("fedcbabcd") == "fedcbabdc"

