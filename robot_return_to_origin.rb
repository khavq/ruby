def judge_circle(moves)
  origin = [0, 0]
  origin == moves.chars.reduce(origin) do |acc, e|
    move(e.to_s.upcase, acc)
  end
end

def move(m, state)
  case m
  when 'U'
    [state[0], state[1] + 1]
  when 'D'
    [state[0], state[1] - 1]
  when 'L'
    [state[0] - 1, state[1]]
  when 'R'
    [state[0] + 1, state[1]]
  else
    puts "Error move: #{m}"
  end
end

moves = "UD"
p judge_circle(moves) == true

moves = "LL"
p judge_circle(moves) == false

moves = "RRDD"
p judge_circle(moves) == false

moves = "LDRRLRUULR"
p judge_circle(moves) == false
