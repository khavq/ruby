# @param {String} s
# @return {Integer}
require 'set'

def length_of_longest_substring(s)
  set = Set.new
  left = 0
  res = 0

  for i in 0..(s.length-1) do
    while set.include?(s[i])
      set.delete(s[left])
      left += 1
    end
    set.add(s[i])
    res = [res, (i-left+1)].max
  end

  res
end

p length_of_longest_substring("abcabcbb") == 3
p length_of_longest_substring("bbbbb") == 1
p length_of_longest_substring("pwwkew") == 3
p length_of_longest_substring("") == 0
