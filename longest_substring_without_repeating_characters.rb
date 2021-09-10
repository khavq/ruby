# @param {String} s
# @return {Integer}
require 'set'
require 'benchmark'

def length_of_longest_substring1(s)
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

def length_of_longest_substring(s)
  head, tail, max_len = 0, 0, 0

    while tail < s.size
        max_len = [tail + 1 - head, max_len].max

        if s[tail + 1] && s[head..tail].include?(s[tail + 1])
            head += 1
            tail += 1 if tail < head
        else
            tail += 1
        end
    end

    max_len
end

#p length_of_longest_substring("abcabcbb") == 3
#p length_of_longest_substring("bbbbb") == 1
#p length_of_longest_substring("pwwkew") == 3
#p length_of_longest_substring("") == 0
def length_of_longest_substring2(input)
  p input
end
p "bench mark"

TIMES = 50
LENGTH = 50

datas = -> (t, l) {
  t.times.map do
    l.times.map do
      [*'a'..'z', *'A'..'Z', *'0'..'9'].sample(1)
    end.join('')
  end
}

inputs = datas.(TIMES, LENGTH)

Benchmark.bm do |benchmark|
  benchmark.report do
    inputs.each do |input|
      length_of_longest_substring1(input)
    end
  end

  benchmark.report do
    inputs.each do |input|
      length_of_longest_substring(input)
    end
  end
end
