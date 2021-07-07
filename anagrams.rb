def anagrams(a, b)
  ( a.chars - b.chars ).count + ( b.chars - a.chars ).count
end

def anagrams?(a, b)
  a.chars == b.chars.reverse
end

a = 'cde'
b = 'dcf'

p ( a.chars - b.chars ).count
p ( b.chars - a.chars ).count

p anagrams(a, b)
