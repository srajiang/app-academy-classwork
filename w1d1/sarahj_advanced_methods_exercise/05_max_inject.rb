# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.

# Don't need to set a default val
# Use inject - within the block we'll use an if statement,
    # when the acc > ele, then we leave as acc
    # else acc = ele


def max_inject(*arr)
    arr.inject do |max, ele|
        if max > ele
            max
        else
            ele
        end
    end
end

p max_inject(1, -4, 0, 7, 5)  # => 7
p max_inject(30, 28, 18)      # => 30
