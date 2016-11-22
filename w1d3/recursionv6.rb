def range(start_num, end_num)
  return [] if end_num <= start_num
  range(start_num, end_num - 1) << end_num - 1
end
#
# p range(1,4) # [2,3]
# p range(5,2) # []
# p range(-2,5) # [-1, 0, 1, 2, 3, 4]


def arr_sum(arr)
  return arr.first if arr.length <= 1
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
    map { |el| el.is_a?(Array) ? el.deep_dup : el }
  end

end
#
#
# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# # robot_parts_copy = robot_parts.dup
# # # shouldn't modify robot_parts
# # robot_parts_copy[1] << "LEDs"
# # # wtf?
# # p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
#
#
# robot_parts_copy = robot_parts.deep_dup
# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # wtf?
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
  fibs = [0, 1]
  if n <= 2
    fibs[0...n]
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
  return [array] if array.length <= 1
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
    counter += (midpoint + 1) if counter
  end
end
#
# puts bsearch([1, 2, 3], 1) # => 0
# puts bsearch([2, 3, 4, 5], 3) # => 1
# puts bsearch([2, 4, 6, 8, 10], 6) # => 2
# puts bsearch([1, 3, 4, 5, 9], 5) # => 3
# puts bsearch([1, 3, 4, 5, 6, 7, 8, 9, 10], 8) # => 6
# puts bsearch([1, 3, 4, 5, 6, 7, 8, 9, 10], 9) # => 7
# puts bsearch([1, 3, 4, 5, 6, 7, 8, 9, 10], 10) # => 8
# puts bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# puts bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# puts bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

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

# b = [38, 27, 43, 3, 9, 82, 10]
# p b.merge_sort
# a = (1..5).to_a.shuffle
# a.merge_sort
# p a.merge_sort == (1..5).to_a
 # p merge([3, 27, 38, 43], [9, 10, 82])

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

# coins = [25, 10, 5, 1]
# p make_change(15, coins)
# p make_change(67, coins)

def pascal(n)
  return [1] if n == 1
  previous_row = pascal(n-1)
  next_row = [1]
  previous_row.each_with_index do |el, idx|
    next_el = previous_row[idx + 1] || 0
    sum = next_el + el
    next_row << sum
  end

  next_row
end

# p pascal(1)
# p pascal(2)
# p pascal(3)
# p pascal(4)
# p pascal(5)


def upcase(str)
  return str.upcase if str.length <= 1
  str[0].upcase + upcase(str[1..-1])
end

# p upcase("Hello world")  # => HELLO WORLD

def reverse(str)
  return str if str.length <= 1
  reverse(str[1..-1]) + str[0]
end

# p reverse("Hello world!") # => !dlrow olleH

def quick_sort(arr)
  return arr if arr.length <= 1
  pivot = arr.first
  left = arr[1..-1].select { |el| el <= pivot }
  right = arr[1..-1].select { |el| el > pivot }
  quick_sort(left) + [pivot] + quick_sort(right)
end

# p quick_sort((1..10).to_a.shuffle) # => [1, 2, 3, 4, 5, 6. 7. 8. 9. 10]


# Exercise 1 - sum_to
#
# Write a function sum_to(n) that uses recursion to calculate the sum
# from 1 to n (inclusive of n).

def sum_to(n)
  return nil if n < 0
  return 1 if n == 1
  sum_to(n - 1) + n
end

#   # Test Cases
# puts sum_to(5)  # => returns 15
# puts sum_to(1)  # => returns 1
# puts sum_to(9)  # => returns 45
# puts sum_to(-8)  # => returns nil

# Exercise 2 - add_numbers
# Write a function add_numbers(nums_array) that takes in an array of
# Fixnums and returns the sum of those numbers. Write this method recursively.
#

def add_numbers(nums_array = nil)
  return nil if nums_array.nil?
  return nums_array.first if nums_array.length == 1
  nums_array[0] + add_numbers(nums_array[1..-1])
end

  # Test Cases
# puts add_numbers([1,2,3,4]) # => returns 10
# puts add_numbers([3]) # => returns 3
# puts add_numbers([-80,34,7]) # => returns -39
# puts add_numbers() # => returns nil


# Exercise 3 - Gamma Function
#
# Let's write a method that will solve Gamma Function recursively.
# The Gamma Function is defined Γ(n) = (n-1)!.

def gamma_fnc(n)
  return nil if n == 0
  return 1 if n == 1
  gamma_fnc(n - 1) * (n - 1)
end
#   # Test Cases
# puts gamma_fnc(0)  # => returns nil
# puts gamma_fnc(1)  # => returns 1
# puts gamma_fnc(4)  # => returns 6
# puts gamma_fnc(8)  # => returns 5040
