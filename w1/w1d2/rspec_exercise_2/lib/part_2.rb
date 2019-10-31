def palindrome?(str)
    str.each_char.with_index do |char, i| 
        return false if char != str[-(i + 1)]
    end
    true
end

def substrings(str)
    sub_strings = []
    (0...str.length).each do |i|
        (0...str.length).each do |i_2|
            sub_strings << str[i..i_2] if i_2 >= i
        end
    end
    sub_strings
end

def palindrome_substrings(str)
    substrings(str).select {|el| el.length > 1 && palindrome?(el) }
end    