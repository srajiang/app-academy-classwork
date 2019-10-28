require_relative "list.rb"

class TodoBoard
    def initialize
        @board = Hash.new

    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        label = args.shift 
        list = @board[label]
        
        case cmd
        when 'mklist'
            @board[label] = List.new(label)
        when 'ls'
            @board.keys.each {|label| puts label}
        when 'showall'
            @board.each {|label,list| list.print}
        when 'mktodo'
            list.add_item(*args)
        when "up"
            list.up(*args.map(&:to_i))
        when "down"
            list.down(*args.map(&:to_i))
        when "swap"
            list.swap(*args.map(&:to_i))
        when "sort"
            list.sort_by_date!
        when "toggle"
            list.toggle_item(*args.map(&:to_i))
        when "priority"
            list.print_priority
        when "purge"
            list.purge
        when "print"
            if args.empty?
                list.print 
            else
                list.print_full_item(*args.map(&:to_i))
            end
        when 'rm'
            list.remove_item(*args.map(&:to_i))
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run 
        until !self.get_command
        end
    end
end

board = TodoBoard.new
board.run