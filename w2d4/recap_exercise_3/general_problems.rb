def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each {|ele| hash[ele] += 1}
    hash.select! {|k, v| v == 1}
    hash.keys
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    arr.each_index {|i| return false if arr[i] == arr[i+1]}
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(string)
    indices = Hash.new{|h,k| h[k] = [] }
    string.each_char.with_index {|char, i| indices[char] << i}
    return indices
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

# i = 3
# j = 4 increment j till there is no more matches
# shovel everything from i -> j into parts


def longest_streak(str)
    i = 0 
    j = 1
    parts = []
    while i < str.length
        
        if str[i] == str[i+1]
            j = i+1
            while str[i] == str[j]
                j+=1
            end
            parts << str[i...j]
            i = j + 1
        else
            parts << str[i]
            i += 1
        end
    end
    parts.sort[-1]
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'


def prime?(num)
    return false if num < 2
    (2...num).each {|i| return false if num % i == 0}
    true
end

def bi_prime?(num)
    array = []
    (2..num/2).each do |i| 
        array << i if prime?(i) && num % i == 0
    end
    array.each_index do |i|
        array.each_index do |j|
            if j >= i
                return true if array[i] * array[j] == num
            end
        end
    end
    false
end

#find all the prime factors
# make pairs of factors and return true when a pair = num

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(str, keys)
     new_str = ""
        str.each_char do |char|
            new_dec = char.ord + keys[0]
            keys.rotate!
            new_dec = new_dec % 122 + 96 if new_dec > 122
            new_str += new_dec.chr
        end
        new_str
end
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = []
    str.each_char {|char| vowels << char if "aeiou".include?(char)}
    vowels.unshift(vowels.pop)
    str.each_char.with_index {|char, i| str[i] = vowels.shift if "aeiou".include?(char)}
    str
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

