# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

# iterate thruogh each char in the string
    # if the chars are the same, then we need to  

# def compress_str(str)
#     new_str = ""
#     count = 0
#     str.each_char.with_index do |char, i|
#         if str[i] == str[i + 1] 
#             count += 1
#         else
#             count += 1
#             if count == 1
#                 new_str += char
#             else
#                 new_str += "#{count}#{char}"
#             end
#             count = 0
#         end
#     end
#     new_str
# end


def compress_str(str)
    new_str = ""
    count = 1
    str.each_char.with_index do |char, i|
        if str[i] == str[i + 1] 
            count += 1
        else
            if count == 1
                new_str += char
            else
                new_str += "#{count}#{char}"
            end
            count = 1
        end
    end
    new_str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
