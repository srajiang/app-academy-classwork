# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

# we need to make one pass of the array, using the comparison-swap, bubbling to the end of the array
# we need an outer loop to check if the full array is sorted, otherwise execute the inner loop again
# track the outer loop using a boolean (sorted? or not sorted?) 
# if you've made a swap at any point, you know the array is not done sorting. 

def bubble_sort(arr)
    sorted = false
    while !sorted
        sorted = true
        (0...arr.length).each do |i|
            if arr[i+1] != nil && arr[i] > arr[i + 1]
                arr[i], arr[i+1] = arr[i+1], arr[i]
                sorted = false
            end
        end
    end
    arr
end



p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]