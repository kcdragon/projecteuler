class Collatz

  attr_reader :memo

  def initialize
    @memo = { 1 => 1, 2 => 2, 4 => 3 }
  end

  def get_total_numbers n, so_far=0
    #if @memo.has_key? n
    #  return @memo[n] + so_far
    #end
    return so_far + 1 if n == 1
    
    if n % 2 == 0
      return get_total_numbers(even(n), so_far + 1)
    else
      return get_total_numbers(odd(n), so_far + 1)
    end
    #return @memo[n]
  end

  def even n
    n / 2
  end

  def odd n
    3*n + 1
  end

end

collatz = Collatz.new

max = 0
val = 0
1.upto(1000000) do |n|
  num = collatz.get_total_numbers n
  max = num if num > max
end
puts max
