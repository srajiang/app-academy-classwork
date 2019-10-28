# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

#Pseudo:
#Iterate 2 -> end of num1
    # Check to see whether num2 mod the iterator is equal to zero -> if YES, both numbers have common factors --> Return false

# num1 = 25 
# num2 = 12
# i = 12

# def coprime?(num1, num2)
#     (2..num1).each do |i| 
#         if num2 % i == 0 && num1 % i == 0
#             return false
#         end
#     end 
#     true
# end

def coprime?(num1, num2)
    (2..num1).none? {|divisor| num1 % divisor == 0 && num2 % divisor == 0}
end
p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false

