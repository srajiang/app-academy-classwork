require "byebug"

def is_prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0}
end

def strange_sums(arr)
    counter = 0
    pairs = {}
    arr.each do |num|
        if pairs.has_key?(num * -1)
            counter += 1
        else
            pairs[num] = true
        end
    end
    return counter
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product?(arr, num)

    counter = 1
    arr.each_with_index do |num1, idx1| 
       arr.each_with_index do |num2, idx2|
            if idx1 > idx2
                return true if num1 * num2 == num
            end
       end
    end
    false
end

# p pair_product?([4, 2, 5, 8], 16)    # true
# p pair_product?([8, 1, 9, 3], 8)     # true
# p pair_product?([3, 4], 12)          # true
# p pair_product?([3, 4, 6, 2, 5], 12) # true
# p pair_product?([4, 2, 5, 7], 16)    # false
# p pair_product?([8, 4, 9, 3], 8)     # false
# p pair_product?([3], 12)             # false

def rampant_repeats(str, hash)
    repeated = ""
    str.each_char { |char| hash.has_key?(char)? repeated += char * hash[char] : repeated += char}
    repeated
end


# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square?(num)
    Math.sqrt(num) % 1 == 0 
end

# p perfect_square?(1)     # true
# p perfect_square?(4)     # true
# p perfect_square?(64)    # true
# p perfect_square?(100)   # true
# p perfect_square?(169)   # true
# p perfect_square?(2)     # false
# p perfect_square?(40)    # false
# p perfect_square?(32)    # false
# p perfect_square?(50)    # false



def factor_count(num)
    (1..num).to_a.count { |i| num % i == 0}
end

def anti_prime?(num)
    highest = factor_count(num)
    (1...num).none? { |i| factor_count(i) >= highest}
end

#p factor_count(5)

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false


def matrix_addition(mat1, mat2)
    mat3 = Array.new(mat1.length) {Array.new([])}
    mat1.each.with_index do |arr, idx1|
        arr.each.with_index do |num, idx2|
            mat3[idx1][idx2] = mat1[idx1][idx2] + mat2[idx1][idx2] 
        end
    end
    mat3
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def factors(num)
    (1..num).to_a.select { |i| num % i == 0}
end

def mutual_factors(*nums)
    nums.inject(factors(nums[0])) { |acc, ele| acc & factors(ele) }
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)

    arr = [1,1,2]
    while num > arr.length
        arr << arr[-3..-1].sum   
    end
    return arr[num - 1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

def is_valid?(matrices)
    first_array = matrices.first
    length = first_array.length
    matrices.all? { |matrix| matrix.length == length }
end

def matrix_addition!(mat1, mat2)
    #debugger
    mat1.each.with_index do |arr, idx1|
        arr.each.with_index do |num, idx2|
            mat1[idx1][idx2] = mat1[idx1][idx2] + mat2[idx1][idx2] 
        end
    end
    mat1
end

def matrix_addition_reloaded(*matrices)
    #debugger
    return nil if is_valid?(matrices) == false
    (1...matrices.length).each { |i| matrix_addition!(matrices[0], matrices[i]) }
    matrices[0]
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(two_d_array)
    two_d_array.each.with_index do |array, idx|    #[0][0]
        if array.all? {|num| num == array[0]}
            return true
        end
    end
    (0...two_d_array.length).each do |i|
        first = two_d_array[0][i]
        flag = true
        (1...two_d_array.length).each do |i2|
            two_d_array[i2][i] == first ? flag : flag = false
        end
        return true if flag == true
    end
    return false
end


# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

# x last
#     x
#         x

#         x 
#     x
# x


def squaragonal?(two_d_array)

    first = two_d_array[0][0]
    last = two_d_array[-1][0]

    flag = true
    #debugger
    (1...two_d_array.length).each do |i|
        comparison = two_d_array[i][i]
        first == comparison ? flag : flag = false
    end
    return flag if flag == true
    
    flag = true
    (1...two_d_array.length).each do |i|
    # debugger
        last == two_d_array[-i][i - 1] ? flag : flag = false
    end
    return flag if flag == true
    false

end


# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

    #   1  = 0    new_val = value at the same index in the previous row + value at index - 1 in previous row
    #   1 1              
    #   1 2 1 
    #   1 3 3 1
    #   1 4 6 4 1

# def make_level(arr)  # [1]
#     debugger
#     new_arr = [1]
#     arr.each.with_index do |num, i|
#         if new_arr.length == arr.length
#             new_arr << 1
#         else
#             new_arr << num + arr[i - 1]
#         end
#     end
#     new_arr
# end

def make_level(arr)
    new_arr = [1]
    (0...arr.length-1).each do |i|
        new_arr << arr[i] + arr[i + 1]
    end
    new_arr << 1
end

def pascals_triangle(num)
    triangle = [[1],[1,1]] 
    while triangle.length < num
        triangle << make_level(triangle[-1])
    end
    return triangle
end


# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

# range 2 ->
# 2^x -1, if prime?
# check counter against n

def mersenne_prime(n)
    counter = 0
    (2..Float::INFINITY).each do |num| 
        possible_prime = 2**num - 1
        if is_prime?(possible_prime) 
            counter += 1
        end
        return possible_prime if counter == n
    end
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

# word -> integer
# integer against (i * (i + 1)) / 2 
    # i in a range
# if integer = any of the values until integer < 

def encode_word(word)
    total = 0
    alpha = ('a'..'z').to_a 
    word.each_char { |char| total += alpha.index(char) + 1}
    total
end

#p encode_word('cat')

def triangular_word?(word)
    encoded = encode_word(word)
    (1..Float::INFINITY).each do |i|
        triangular = ((i * (i + 1)) / 2)
        if triangular == encoded
            return true
        elsif triangular > encoded
            return false
        end
    end
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # fals

# Evaluate left pair of given array
    # if meets condition, "is_consecutive"
        # unshift twice
    # else 
        # unshift and shovel number into a new array
    

def consecutive_collapse(arr)
    new_arr = []

    

    new_arr
end
