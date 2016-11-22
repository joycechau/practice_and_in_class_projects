def range(start_num, end_num)
end
#
# p range(1,4) # [2,3]
# p range(5,2) # []
# p range(-2,5) # [-1, 0, 1, 2, 3, 4]


def arr_sum(arr)

end
#
# p arr_sum([1,2,3]) # 6
# p arr_sum([]) # nil
# p arr_sum([1]) # 1
# p arr_sum([-5,2,3,7]) # 7

def exp(base, power)

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

end

# p fibonacci(1) # => [0]
# p fibonacci(2) # => [0 , 1]
# p fibonacci(3) # => [0, 1, 1]
# p fibonacci(10) # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]


def permutations(array)

end
#
# # p [1,2,3].permutation.to_a.sort == [[1, 2, 3], [1, 3, 2], [2, 1, 3],
# # [2, 3, 1], [3, 2, 1], [3, 1, 2]].sort
#
# # p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
# #                         #     [2, 1, 3], [2, 3, 1],
# #                         #     [3, 2, 1], [3, 1, 2]]
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
  end

  def merge

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

  end
end

# p [].subsets # => [[]]
# p [1].subsets # => [[], [1]]
# p [1, 2].subsets # => [[], [1], [2], [1, 2]]
# p [1, 2, 3].subsets
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def make_change
end

# coins = [25, 10, 5, 1]
# p make_change(15, coins)
# p make_change(67, coins)


def pascal(n)

end

# p pascal(1)
# p pascal(2)
# p pascal(3)
# p pascal(4)
# p pascal(5)


def upcase(str)
end

# p upcase("Hello world")  # => HELLO WORLD

def reverse(str)
end

# p reverse("Hello world!") # => !dlrow olleH

def quick_sort(arr)
end

# p quick_sort((1..10).to_a.shuffle) # => [1, 2, 3, 4, 5, 6. 7. 8. 9. 10]
