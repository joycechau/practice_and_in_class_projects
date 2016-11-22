def range(start_num, end_num)
  return [] if end_num <= start_num
  range(start_num, end_num - 1) << end_num - 1
end
#
# p range(1,4) # [2,3]
# p range(5,2) # []
# p range(-2,5) # [-1, 0, 1, 2, 3, 4]


def arr_sum(arr)
  return 0 if arr.empty?
  arr[0] + arr_sum(arr[1..-1])
end
#
# p arr_sum([1,2,3]) # 6
# p arr_sum([]) # nil
# p arr_sum([1]) # 1
# p arr_sum([-5,2,3,7]) # 7

def exp(base, power)
  # return 1 if power == 0
  # base * exp(base, power - 1)

  return 1 if power == 0
  half = exp(base, power / 2)
  if power.even?
    half * half
  else
    base * half * half
  end
end
#
# p exp(2, 0) # 1
# p exp(20, 1) # 20
# p exp(2, 2) # 4
# p exp(2, 4) # 16
# p exp(3, 4) # 81
# p exp(-3, 4) # 81
# p exp(5, 3) #125
# p exp(-3, 3) # -27

class Array

  def deep_dup
    self.map {|el| el.is_a?(Array) ? el.deep_dup : el }
  end

end
#
#
robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]
# robot_parts_copy = robot_parts.dup
# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # wtf?
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]


robot_parts_copy = robot_parts.deep_dup
# shouldn't modify robot_parts
robot_parts_copy[1] << "LEDs"
# wtf?
# p robot_parts[1] # => ["capacitors", "resistors", "inductors"]
# p robot_parts_copy[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
#
# orig = [1, [2], [3, [4]]]
# copy = orig.deep_dup
# copy[2][1] << 5
# p orig[2] # => [3, [4]]
# p copy[2] # => [3, [4,5]]
# p orig # => [1, [2], [3, [4]]]
# p copy # => [1, [2], [3, [4, 5]]]

def fibonacci(n)
  #recursive
  fibs = [0, 1]
  if n <= 2
    fibs.take(n)
  else
    fibs = fibonacci(n - 1)
    fibs << fibs[-1] + fibs[-2]
  end
end

# p fibonacci(1) # => [0]
# p fibonacci(2) # => [0 , 1]
# p fibonacci(3) # => [0, 1, 1]
# p fibonacci(10) # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]


def permutations(array)
  return [array] if array.length == 1
  first = array.shift
  perms = permutations(array)
  total_perms = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_perms << perm[0...i] + [first] + perm[i..-1]
    end
  end

  total_perms
end
#
# p [1,2,3].permutation.to_a.sort == [[1, 2, 3], [1, 3, 2], [2, 1, 3],
# [2, 3, 1], [3, 2, 1], [3, 1, 2]].sort
#
# p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 2, 1], [3, 1, 2]]
#
# # p permutations([1, 2, 3, 4])
# p permutations([1, 2, 3, 4]).sort == [[1, 2, 3, 4],
#  [1, 2, 4, 3],
#  [1, 3, 2, 4],
#  [1, 3, 4, 2],
#  [1, 4, 2, 3],
#  [1, 4, 3, 2],
#  [2, 1, 3, 4],
#  [2, 1, 4, 3],
#  [2, 3, 1, 4],
#  [2, 3, 4, 1],
#  [2, 4, 1, 3],
#  [2, 4, 3, 1],
#  [3, 1, 2, 4],
#  [3, 1, 4, 2],
#  [3, 2, 1, 4],
#  [3, 2, 4, 1],
#  [3, 4, 1, 2],
#  [3, 4, 2, 1],
#  [4, 1, 2, 3],
#  [4, 1, 3, 2],
#  [4, 2, 1, 3],
#  [4, 2, 3, 1],
#  [4, 3, 1, 2],
#  [4, 3, 2, 1]].sort

def bsearch(array, target)
  return nil if array.empty?
  midpoint = array.length / 2

  if array[midpoint] > target
    bsearch(array[0...midpoint], target)
  elsif array[midpoint] == target
    midpoint
  else
    counter = bsearch(array[(midpoint + 1)..-1], target)
    counter += (midpoint + 1) unless counter.nil?
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 3, 4, 5, 6, 7, 8, 9, 10], 8) # => 6
# p bsearch([1, 3, 4, 5, 6, 7, 8, 9, 10], 9) # => 7
# p bsearch([1, 3, 4, 5, 6, 7, 8, 9, 10], 10) # => 8
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

class Array
  def merge_sort
    return self if self.length <= 1
    midpoint = self.length / 2
    left = self[0...midpoint]
    right = self[midpoint..-1]
    sorted_left = left.merge_sort
    sorted_right = right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged = []
    until left.empty? || right.empty?
      if left.first < right.first
        merged << left.shift
      else
        merged << right.shift
      end
    end

    merged + left + right
  end

end

b = [38, 27, 43, 3, 9, 82, 10]
# p b.merge_sort
# a = (1..5).to_a.shuffle
# p a.merge_sort
# p a.merge_sort == (1..5).to_a

class Array
  def subsets
    return [[]] if self.empty?
    subs = self[0...self.length - 1].subsets
    subs += subs.map { |sub| sub + [self.last] }
  end
end



# p [].subsets # => [[]]
# p [1].subsets # => [[], [1]]
# p [1, 2].subsets # => [[], [1], [2], [1, 2]]
# p [1, 2, 3].subsets
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


def make_change(target, coins)
  return [] if target == 0
  return nil if coins.none? { |coin| coin <= target }
  new_coins = coins.sort.reverse
  best_change = nil

  new_coins.each_with_index do |coin, idx|
    next if coin > target
    remainder = target - coin
    best_remainder = make_change(remainder, new_coins.drop(idx))
    next if best_remainder.nil?
    this_change = [coin] + best_remainder
    if best_change.nil? || this_change.count < best_change.count
      best_change = this_change
    end
  end

  best_change
end

coins = [25, 10, 5, 1]
p make_change(15, coins)
p make_change(67, coins)
