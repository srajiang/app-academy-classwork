def sum_to(n)
    return n if n == 0
    return nil if n < 0
    n + sum_to(n-1)
end

# p sum_to(5)
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8) 

def add_numbers(nums_arr)
    return nil if nums_arr.empty?
    return nums_arr[0] if nums_arr.length == 1
    nums_arr[0] + add_numbers(nums_arr[1..-1]) 
end

# p add_numbers([1,2,3,4])
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil

def gamma_fnc(n)
    gamma = n - 1
    return nil if gamma < 0
    return 1 if gamma == 0 
    p gamma * gamma_fnc(gamma)
end

# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, favorite)
    curr_flavor = flavors[0]
    return true if curr_flavor == favorite
    return false if curr_flavor == nil
    ice_cream_shop(flavors[1..-1], favorite) 
end

# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p ice_cream_shop([], 'honey lavender')  # => returns false


def reverse(str)
    return "" if str.length == 0
    reverse(str[1..-1]) + str[0]
end

# p reverse("house") # => "esuoh"
# p reverse("dog") # => "god"
# p reverse("atom") # => "mota"
# p reverse("q") # => "q"
# p reverse("id") # => "di"
# p reverse("") # => ""

class Array

    def q_sort
        #base case (if the arr size is 1, then return the array with the thing in it, if the array size is 0, return the array with the thing in it)
        return self if self.length <= 1
        # recursive case 
        pivot = self.first
        left = []
        right = []

        self.drop(1).each do |el|
            if el < pivot
                left << el
            else
                right << el
            end
        end
        left.q_sort + [pivot] + right.q_sort
    end

end

# arr = [2,6,3,8,4,6,2,1]