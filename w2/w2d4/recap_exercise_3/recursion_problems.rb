def multiply_recursively(times, num)
    return 0 if times < 1
    num + multiply_recursively(times - 1, num)
end

def multiply(a, b)
    if (a < 0) ^ (b < 0)
        return -1 * multiply_recursively(a.abs, b.abs)
    else 
        return multiply_recursively(a.abs,b.abs)
    end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(num)
    return [] if num == 0 
    return [2] if num == 1
    return [2, 1] if num == 2

end


p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]