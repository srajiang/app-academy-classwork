class Item

    attr_reader :deadline, :done
    attr_accessor :title, :description

    def self.valid_date?(date_string)

        dates = date_string.split("-")
        dates.map!(&:to_i)

        return false if dates[0].to_s.length != 4
        return false if dates[1] > 12 || dates[1] < 1
        return false if dates[2] > 31 || dates[2] < 1
        true 

    #     extension: add condition for February
    end

    def initialize(title, deadline, description)
        # p 'I am initializing a new Item'
        @title = title
        self.deadline = deadline
        @description = description
        @done = false
    end

    def deadline=(new_deadline)
        # 'I am adding the deadline'
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            # p 'we did not have a valid date, raising exception'
            raise 'invalid date'
        end
    end

    def toggle
        if @done == false
            @done = true
        else
            @done = false
        end
    end



end

# first 4 indices (0 -> 3) those should be numbers -
# string of index 5 
# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# )