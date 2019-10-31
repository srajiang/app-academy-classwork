require 'byebug'

def range(start,finish)
    return [] if start >= finish 
    [start] + range(start+1,finish)
end

def iterative_range(array)
    count = 0
    array.each{|num| count+= num}
    count
end

def recursive_range(array)
    return 0 if array.empty?
    array[0] + recursive_range(array[1..-1])
end

def recursion_1(base, power)
    return 1 if power == 0
    # return base if power == 1
    base * recursion_1(base, power - 1)
end

def recursion_2(base, power)
    return 1 if power == 0
    # return base if power == 1

    if power.even?
        recursion_2(base, power/2) ** 2
    else
        base * (recursion_2(base, (power-1)/2) ** 2)
    end
end

def fib(num)
    return [0,1].take(num) if num <= 2
    prev_fib = fib(num-1)
    next_fib = prev_fib[-1] + prev_fib[-2]
    prev_fib << next_fib
end

def iter_fib(num)
    return [] if num == 0 
    return [0] if num == 1
    new_arr = [0,1]

    while new_arr.length < num
        new_arr << new_arr[-1] + new_arr[-2] 
    end 
    new_arr
end

def bsearch(array,target)
    
    #early termination if the target is outside the range of the sorted array
    return nil if array[-1] < target || array[0] > target
    
    # get my current position
    curr_position = array.length / 2

    #base case 
    if array.length == 1
        array[curr_position] == target ? curr_position : nil
    end

    if array[curr_position] < target 
        result_position = bsearch(array[curr_position..-1],target) #recurse on what's to the right of me
       
        if result_position == nil  #if we got to nil (i.e. the result found no target)
            result_position        # return nil for us as well
        else    
            curr_position + result_position   # we found the target's position relative to our current position
        end

    else array[curr_position] > target 
        bsearch(array[0...curr_position],target)     
    end

end


# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

class Array
    def merge_sort
        return self if self.length < 2

        mid = self.length / 2
        left = self[0...mid]  
        right = self[(mid..-1])

        sorted_left = left.merge_sort
        sorted_right = right.merge_sort

        merge(sorted_left, sorted_right)
    end
end

def merge(left, right)
    merged = []

    while !left.empty? && !right.empty? 
        if left.first < right.first
            merged << left.first
            left.shift
        elsif left.first > right.first
            merged << right.first
            right.shift
        else
            merged << left.shift << right.shift
        end 
    end 
    merged + left + right 
end


# base case is when we no longer have an array?
# 38 27 43 3
# merged = 38
# l = 1 
# r = 0
#

# [2, 8, 4, 1, 3, 2, 5, 7, 6]
# [2, 8, 4, 1] [3, 2, 5, 7, 6]
# [2, 8] [4,1] [3, 2,] [5, 7, 6]
# [2] [8] 4 1 3 2 5 7 6

# merge(merge_sort(first_h),merge_sort(second_h))

#[1,2,3]
def subsets(array)
    return [[]] if array.empty?
    last = array[-1]
    prev_subset = subsets(array[0...-1])  
    new_arr = []
    new_arr += prev_subset
    prev_subset.each do |ele|
        copy = ele.dup
        copy << last 
        new_arr << copy
    end
    new_arr 
end

# subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
#sub([])    ==> [[]]
#sub([1])   ==> [[], [1]]
#sub([1, 2]) # => [[], [1]], [2], [1, 2]]
#subsets([1, 2, 3]) ==> [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(arr)
    
    return [arr] if arr.length == 1
    prev_perm = permutations(arr[0...-1])
    all_perm = []
 
    prev_perm.each do |perm|

        last = arr[-1]
        (0..perm.length).each do |idx|
            all_perm << perm[0...idx] + [last] + perm[idx..-1]
        end

    end
    all_perm
end

# p ([1]) => [[1]]
# p([1,2]) => [[1,2], [2,1]]
# p([1,2,3]) => [1,2,3] [3,1,2] [1,3,2] [3,2,1] [2,1,3] [2,3,1]
