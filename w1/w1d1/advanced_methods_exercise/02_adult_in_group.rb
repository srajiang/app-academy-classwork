# Write a method, adult_in_group?(people), that accepts an array containing people.
# The method should return true if there is at least 1 person with an age of 18 or greater.
# The method should return false otherwise.

# iterate through the array, check the age: key within each ele of the array
# if age: >= 18, we want to return true
# else, return false

#option 1: use .each method
#option 2: use .any? method <-- would be cleaner

def adult_in_group?(people)

    people.any? {|hash| hash[:age] >= 18 }

end

people_1 = [
    {name: "Jack", age: 17},
    {name: "Jill", age: 21},
    {name: "Alice", age: 15},
    {name: "Bob", age: 16}
]
p adult_in_group?(people_1)    # => true

people_2 = [
    {name: "Jane", age: 12},
    {name: "John", age: 13},
    {name: "Ashley", age: 10},
    {name: "Bill", age: 16}
]
p adult_in_group?(people_2)    # => false