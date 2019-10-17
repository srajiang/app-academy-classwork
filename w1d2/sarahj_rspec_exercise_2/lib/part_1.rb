def partition(arr, num)
    lesser = []
    greater = []
    arr.each {|el| el >= num ? greater << el : lesser << el}
    [lesser, greater]
end

def merge(hash_1, hash_2)
    hash_1.merge(hash_2)
end

def censor(sent, curses)
    sent.split(" ").map do |word| 
        if curses.include?(word.downcase)
            clean_word(word) 
        else
            word
        end
    end.join(" ")
end

def clean_word(word)
    word.chars.map {|c| "aeiou".include?(c.downcase) ? "*" : c }.join("")
end

def power_of_two?(num)
    return true if num == 1
    (0...Float::INFINITY).each do |e|
        res = 2**e
        return true if res == num
        return false if res > num
    end
end