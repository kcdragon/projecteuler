sum = 0
((1..100).inject :*).to_s.each_char do |c|
  sum += c.to_i
end
puts sum
