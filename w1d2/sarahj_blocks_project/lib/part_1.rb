def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(puppies)
    puppies.reject {|pup| pup["age"] <= 2 }
end

def count_positive_subarrays(arrays)
    arrays.count {|sub| sub.sum > 0}
end

def aba_translate(str)
    str.each_char.map {|char| "aeiou".include?(char) ? char + "b" + char : char }.join
end

def aba_array(words)
    words.map {|word| aba_translate(word) }
end
