# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

# Option 1
# Iterate through each elem of the array
    # Compare elem at index i -> i + 1 and to i - 1
    # If i > both of those, shovel it into an empty array and return that array at the end

# def peak_finder(arr)
#     new_arr = []
#     arr.each.with_index do |num, idx| 
#         if arr[idx + 1] != nil && arr[idx - 1] != nil 
#             if arr[idx] > arr[idx + 1] && arr[idx] > arr[idx - 1]
#                 new_arr << arr[idx]
#             end
#         else
#             if arr[idx + 1] == nil && arr[idx] > arr[idx - 1]
#                 new_arr << arr[idx]
#             elsif arr[idx - 1] == nil && arr[idx] > arr[idx + 1]
#                 new_arr << arr[idx]
#             end
#         end
#     end
#     new_arr
# end

def peak_finder(arr)
    new_arr = []
    arr.unshift(0)
    arr.push(0)
    (1..arr.length - 2).each do |idx|
        if arr[idx] > arr[idx + 1] && arr[idx] > arr[idx - 1]
            new_arr << arr[idx]
        end
    end
    new_arr
end



p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
