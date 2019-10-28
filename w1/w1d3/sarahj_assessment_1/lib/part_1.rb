def is_prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0}
end

#counter = num thats given -- maybe not
# use a while loop and decrement the counter

def nth_prime(num)

    while num >= 1
        (0..Float::INFINITY).each do |i| 
            if is_prime?(i)
                num -= 1
                if num == 0 
                    return i
                end
            end
        end
    end
end

def prime_range(min, max)
    (min..max).to_a.select { |num| is_prime?(num)}
end