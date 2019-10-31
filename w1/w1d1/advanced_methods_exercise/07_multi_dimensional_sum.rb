# Write a method, multi_dimensional_sum(array), that accepts a multidimensional array as an arg 
# and returns the sum of all numbers in the array.

# We need to keep running flatten as long as it's a multi-dimensional array.
# Once it's completely flattened, use the sum method to sum the elements

def multi_dimensional_sum(array)
    array.flatten.sum
end

arr_1 = [
    [4, 3, 1],
    [8, 1],
    [2]
]

p multi_dimensional_sum(arr_1)    # => 19

arr_2 = [
    [ [3, 6], [7] ],
    [ [5, 2], 1 ]
]

p multi_dimensional_sum(arr_2)    # => 24
