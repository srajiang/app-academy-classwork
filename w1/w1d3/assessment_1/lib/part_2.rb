def element_count(arr)
    hash = Hash.new(0)
    arr.each {|word| hash[word] += 1}
    hash
end

def char_replace!(str, hash)
    str.each_char.with_index { |char, i| str[i] = hash[char] if hash[char] != nil }
end

def product_inject(arr)
    arr.inject {|result, ele| result * ele }
end