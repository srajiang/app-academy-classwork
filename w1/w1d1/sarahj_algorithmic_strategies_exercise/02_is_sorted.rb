# Write a method, is_sorted(arr), that accepts an array of numbers as an arg.
# The method should return true if the elements are in increasing order, false otherwise.
# Do not use the built-in Array#sort in your solution :)

# inject method to compare whether the accumulator is > ele. 
    # if the acc is > element, then return false
# otherwise return true at the end

def is_sorted(arr)
    arr.inject do |acc, ele| 
        if acc > ele 
            return false
        else
            ele
        end
    end
    true
end

p is_sorted([1, 4, 10, 13, 15])       # => true
p is_sorted([1, 4, 10, 10, 13, 15])   # => true
p is_sorted([1, 2, 5, 3, 4 ])         # => false
