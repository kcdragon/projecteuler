def perfect_square?(number)
  debugger
  return false if number.odd?

  binary_rep = number.to_s(2)

  index = binary_rep.length - 1
  number_of_trailing_zeros = 0
  while index >= 0 && binary_rep[index] == 0
    number_of_trailing_zeros += 1
    index -= 1
  end

  return false if number_of_trailing_zeros.odd?

  return perfect_square?(number >> number_of_trailing_zeros)
end


def square_root
end
