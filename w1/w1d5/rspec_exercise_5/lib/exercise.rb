require 'byebug'

def zip(*arrs)
    
    cols = arrs[0].length 
    rows = arrs.length     

    zipped = Array.new(cols) {Array.new([])}

    (0...rows).each do |row|
        (0...cols).each do |col|
            zipped[col] << arrs[row][col]
        end
    end
    zipped
end


def prizz_proc(arr, prc1, prc2)
    arr.select { |ele|  prc1.call(ele) ^ prc2.call(ele) }
end


def zany_zip(*arrays)

    cols = arrays.sort_by {|arr| arr.length}[-1].length
    rows = arrays.length

    zipped = Array.new(cols) {Array.new([])}

    (0...rows).each do |row|
        (0...cols).each do |col|
            zipped[col] << arrays[row][col]
        end
    end
    zipped
end


def maximum(arr, &proc)
    arr.inject do |acc, ele|
        acc_res = proc.call(acc)
        ele_res = proc.call(ele)
        acc_res <= ele_res ? ele : acc
    end
end

def my_group_by(arr, &proc)
    result = Hash.new {|hash, key| hash[key] = []}
    arr.each { |ele| result[proc.call(ele)] << ele }
    result
end

def max_tie_breaker(arr, proc, &block)
    largest_ele = arr[0]

    arr.each do |ele| 

        block_res = block.call(ele)

        if block_res > block.call(largest_ele)
            largest_ele = ele
        elsif block_res == block.call(largest_ele)
            proc.call(ele) > proc.call(largest_ele) ? largest_ele = ele : largest_ele
        end 
    end
    largest_ele
end


def silly_syllables(sentence)
    sentence = sentence.split(" ")
    sentence.map! do |word|
        num_vowels = word.each_char.count {|char| "aeiou".include?(char)}
        num_vowels < 2 ? word : sillify(word) 
    end.join(" ")
end

def sillify(word)
    f_vowel_idx, l_vowel_idx  = nil, nil
    word.each_char.with_index do |char, idx|
        if "aeiou".include?(char) 
            f_vowel_idx == nil ? (f_vowel_idx = idx) : (l_vowel_idx = idx)
        end
    end
    word[f_vowel_idx..l_vowel_idx]
end

# var to track index of first vowel
# var to track index of last vowel
# loop until you find the first vowel
# then after that if first vowl ! nill, and you've found a vowel, set sec vowel


# def zip(*arrays)
#     zipped = Array.new(arrays[0].length) { Array.new([])}

#     arrays.each.with_index do |arr1,idx1| 
#         arr1.each.with_index { |var, idx2| zipped[idx2] << var }
#     end
#     zipped
# end


# def prizz_proc(arr,prc1,prc2)
#     arr.select { |ele| (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))}
# end

# def zany_zip(*arrays)
#     longest_length = arrays.sort_by { |ele| ele.length}.last.length

#     zipped = Array.new(longest_length) { Array.new([])}
#     arrays.each.with_index do |arr1, idx1|
#         i = 0
#         longest_length.times do
#             zipped[i] << arr1[i]
#             i += 1
#         end 
#     end
#     zipped
# end


# def maximum(array, &prc)
#     array.inject do |accl, ele|
#        prc.call(ele) >= prc.call(accl) ? ele : accl
#     end 
# end
# #need to initiate a hash, where default val is an empty array
# #looping through our array
#     #when we assign the key

# def my_group_by(arr, &prc)
#     hash = Hash.new {|hash, k| hash[k] = [] }
#     arr.each {|ele| hash[prc.call(ele)] << ele}
#     hash
# end

# def max_tie_breaker(arr, proc, &block)
#     max = [arr.shift]
#     arr.each.with_index do |ele|
#        if block.call(ele) > block.call(max[0])
#             max[0] = ele
#        elsif  block.call(ele) == block.call(max[0])
#             max << ele
#        end
#     end
#     max.inject { |accl, ele|  proc.call(accl) < proc.call(ele) ? ele : accl }
# end

# def silly_syllables(sent)
#     vowels = "aeiou"
#     words = sent.split
#     words.each.with_index do |word, idx1|
#         if word.split("").count {|char| vowels.include?(char)} > 1
#             first_vowel_idx = nil 
#             last_vowel_idx = nil

#             word.each_char.with_index do |char, idx2| 
#                 if vowels.include?(char) && first_vowel_idx == nil
#                     first_vowel_idx = idx2
#                 elsif vowels.include?(char) && first_vowel_idx != nil
#                     last_vowel_idx = idx2
#                 end
#             end
#             words[idx1] = words[idx1][first_vowel_idx..last_vowel_idx]

#         end 
#     end
#     words.join(" ")
# end

