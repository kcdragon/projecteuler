X_MAX = 20
Y_MAX = 20

# state = [x,y]
def get_next_states state
  next_states = []
  next_states << [state[0] + 1, state[1]] if state[0] + 1 <= X_MAX
  next_states << [state[0], state[1] + 1] if state[1] + 1 <= Y_MAX
  return next_states
end

def goal_state? state
  state == [X_MAX, Y_MAX]
end

def start init_state
  get_number_of_paths init_state
end

def get_number_of_paths state
  next_states = get_next_states state
  return 1 if next_states.length == 1
  sum = 0
  next_states.each do |next_state|
    sum += get_number_of_paths(next_state)
  end
  return sum
end

puts start [0, 0]
