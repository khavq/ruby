# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  s.chars.chunk do |e|
    c ||= []
    if c.include?(e)
      c = nil
    else
      c.push(e)
    end
  end.each do |e, ary|
    p [e, ary]
  end
  nil
end

p length_of_longest_substring("abcabcbb") == 3
p length_of_longest_substring("bbbbb") == 1
p length_of_longest_substring("pwwkew") == 3
p length_of_longest_substring("") == 0
