require_relative "item.rb"

class List

   def initialize(label)
    @label = label
    @items = []
   end

   def label
    @label
   end

   def label=(new_label)
    @label = new_label
   end

   def add_item(title,deadline,description="")
        begin
            # p 'i am beginning'
            @items << Item.new(title,deadline,description)
            true
        rescue => exception
            # p 'I have been rescued'
            false
        end
    end

   def size
        @items.length 
   end
    
   def valid_index?(index)
        @items.each_index {|i| return true if index == i }
        false
   end

   def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] =  @items[index_2], @items[index_1]
            true
        else
            false
        end
   end

   def [](index)
        if self.valid_index?(index)
            @items[index]
        else
            nil
        end
   end

   TOTAL_LENGTH = 60
   
   def print
        puts "-".ljust(TOTAL_LENGTH,"-")
        puts @label.upcase.center(TOTAL_LENGTH, " ")
        puts "-".ljust(TOTAL_LENGTH,"-")
        col_length = TOTAL_LENGTH / 4
        puts 'Index'.ljust(col_length - 1, " ") + "|" + ' Item'.ljust(col_length - 1, " ") + "|" + ' Deadline'.ljust(col_length - 1, " ") + '|' + " Done".ljust(col_length - 1, " ")
        puts "-".ljust(TOTAL_LENGTH,"-")
        (0...self.size).each do |i| 
            title = self[i].title
            deadline = self[i].deadline
            self[i].done ? status="\u2713" : status = " "
            puts "#{i}".ljust(col_length - 1, " ") + "|" + " #{title}".ljust(col_length -1, " ") + "|" + " #{deadline}".ljust(col_length -1, " ") + "|" + " [#{status}]"
        end
         puts "-".ljust(TOTAL_LENGTH,"-")
    end

    def print_full_item(index)
        if valid_index?(index)
            puts "-".ljust(TOTAL_LENGTH,"-")
            self[index].done ? status="\u2713" : status = " "
            puts "Item: #{self[index].title}".ljust(TOTAL_LENGTH/2, " ") + " Due: #{self[index].deadline}    [#{status}]".rjust(TOTAL_LENGTH/2, " ") 
            puts "Desc: #{self[index].description}".ljust(TOTAL_LENGTH/2, " ") + "Priority: #{index}".rjust(TOTAL_LENGTH/2, " ")
            puts "-".ljust(TOTAL_LENGTH,"-")
        end 
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount)   
        return false if !valid_index?(index)
            amount.times do 
                self.swap(index, index-1)
                index = index - 1
           end
        true
    end

    def down(index, amount)
        return false if !valid_index?(index)
            amount.times do 
                self.swap(index, index+1)
                index = index + 1
            end
        true
    end
    
    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        if valid_index?(index)
            @items.delete_at(index)
            return true
        end
        false

    end

    def purge
        indices = []
        @items.each.with_index do |item, index|
            if item.done == true
                indices << index
            end
        end
        indices.each {|i| remove_item(i)}
    end    

end


#check all the items
#get the deadline of every item in our list

# new_list = List.new("App Academy")
# new_list.add_item("aa","2019-10-25","finish this problem")
# new_list.add_item("bb","2018-09-20","go to lunch")
# new_list.add_item("cc","2020-10-10","check in to aa")
# new_list.add_item("dd","2002-10-10","work with partner")

# new_list.print
# new_list.swap("0","3")
# new_list.print


# new_list.print_full_item(1)
# new_list.print_priority

# p new_list.add_item("bb","2018-09-20","go to lunch")
# p new_list.items

# p new_list.valid_index?(0)
# p new_list.valid_index?(1)

# p new_list.swap(0,1)  # true
# p new_list.items
# p new_list.swap(0,10) # false
# p new_list.items

# p new_list[0] #something
# p new_list[1]   #nil