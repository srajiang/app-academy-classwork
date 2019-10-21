

def duos(str)
    count = 0
    str.each_char.with_index do |char, i|
        count += 1 if char == str[i + 1]
    end
    count
end

def sentence_swap(str, hash)

    words = str.split(" ")
    words.each.with_index {|word, i| words[i] = hash[word] if hash.has_key? word }
    words.join(" ")

end

def hash_mapped(hash, proc, &block)
    var = Hash.new
    hash.each {|k, v| var[block.call(k)] = proc.call(v) }
    var
end

def counted_characters(str)
    char = str.split("")
    hash = Hash.new(0)
    char.each { |char| hash[char] += 1}
    hash
    .select { |k,v| v > 2}
    .keys
end

#immediatly return true if three consecutive characters
#variation ont he first one we wrote
#loop through every index
#if the thing next to is the same as the one before me, and one after me


#keep track of the index of the first character
#when the character is different we update the index
#we are going to track two different indexs
#going to update the second index


def triplet_true?(str)
    str.each_char.with_index { |char, i|  return true if char * 3 == str[i...i+3] }
    false
end

def energetic_encoding(str, hash)
    words = str.split(" ")
    words.each do |word|
        word.each_char.with_index {|char, idx| hash.has_key?(char) ? word[idx] = hash[char] : word[idx] = "?" }
    end
    words.join(" ")
end

def uncompress(str)
    letters = str.split("")
    new_str = ""
    letters.each.with_index do |char, idx|
        char.to_i.times { new_str += letters[idx - 1]} if idx % 2 != 0 
    end
    new_str
end

#loop through our array => select
#loop through each of our procs
#procs.all? of the ele

def conjunct_select(arr, *procs)
    arr.select do |ele|
        procs.all?{ |proc| proc.call(ele)} 
    end
end

def convert_pig_latin(str)
    str.split(" ").map! { |word| word.length > 2 ? piggify(word) : word}
    .join(" ")
end

def piggify(word)
    (0...word.length).each do |i|
        if "aeiou".include?(word[i].downcase)
            if i == 0
                return word + "yay"
            elsif word[0].upcase == word[0]
                return (word[i..-1] + word[0...i]+ "ay").capitalize
            else
                return word[i..-1] + word[0...i]+ "ay"
            end
        end
    end
    
end

def reverberate(sent)
    sent.split(" ").map! { |word| word.length < 3 ? word : translate(word)}.join(" ")
end

def translate(word)
    vowels = "aeiouAEIOU"
    if vowels.include?(word[-1]) 
        return word + word.downcase
    else
        (word.length-1).downto(0) {|i| return word + word[i..-1] if vowels.include?(word[i]) }
    end
end

VOWELS = "aeiouAEIOU"

def disjunct_select(arr, *procs)
    arr.select do |ele|
        procs.any? { |proc| proc.call(ele)} 
    end
end

def alternating_vowel(sent)
    sent
        .split(" ")
        .map!
        .with_index{ |word, idx| idx.even? ? even_index(word) : odd_index(word)}
        .join(" ")

end


def even_index(word)
    word.each_char.with_index do |char, idx|    
        if VOWELS.include?(char)
            word[idx] = ""
            break
        end
    end
    word
end

def odd_index(word)
    (word.length-1).downto(0).each do |idx|    
        if VOWELS.include?(word[idx])
            word[idx] = ""
            break
        end
    end
    word
end

def silly_talk(sent)
    sent.split(" ").map! { |word| VOWELS.include?(word[-1]) ? (word + word[-1]) : add_b(word) }.join(" ")


end

def add_b(word)
    new_str = ""
    word.each_char { |char| VOWELS.include?(char) ? new_str += (char + "b" + char.downcase) : new_str += char }
    new_str
end


def compress(str)
    new_str = "" 
    count = 1 
    str.each_char.with_index do |char, idx|
        if char == str[idx + 1] 
            count += 1
        elsif count > 1 && char != str[idx + 1]
            new_str += char + count.to_s
            count = 1
        else
            new_str += char
        end  
    end
    new_str
end