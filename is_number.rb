# @param {String} s
# @return {Boolean}
def is_number(s)
  n = s.match?(/\A[-+]?[0-9eE]*\.([0-9eE])*[^eE]\z/)
  unless n == true
    puts "FAILED: #{s}"
  end
  n
end

p ["2", "0089", "-0.1", "+3.14", "4.", "-.9", "2e10", "-90E3", "3e+7", "+6e-1", "53.5e93", "-123.456e789"].map{|e| is_number(e) }
p ["abc", "1a", "1e", "e3", "99e2.5", "--6", "-+3", "95a54e53"].map{|e| is_number(e)}