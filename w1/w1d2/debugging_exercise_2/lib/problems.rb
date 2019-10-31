# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require 'byebug'

def largest_prime_factor(num)
    largest_prime = 0
    (2..num).each do |n| 
        if num % n == 0 && prime?(n) && n > largest_prime
            largest_prime = n
        end
    end
    largest_prime
end

def prime?(num)
    return false if num < 2
    (2...num).all? {|n| num % n != 0 }
end


def unique_chars?(str)
    chars = str.split("")
    hash = Hash.new(0)
    chars.each { |char| hash[char] += 1 }
    hash.values.none? {|val| val > 1}     
end

def dupe_indices(arr)
    char_indices = {}

    arr.each_with_index do |char, i|
        char_indices[char] = [] if !char_indices.has_key?(char)
        char_indices[char] << i
    end
    char_indices.select { |k, v| v.length > 1} 
end

def ana_array(arr_1, arr_2)
    hash_1, hash_2 = Hash.new(0), Hash.new(0)
    arr_1.each { |el| hash_1[el] += 1 }
    arr_2.each { |el| hash_2[el] += 1 }
    hash_1 == hash_2
end