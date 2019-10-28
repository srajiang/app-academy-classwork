class String

    def select(&prc)
        return "" if prc == nil
        new_str = ""
        self.each_char {|char| new_str += char if prc.call(char)}
        return new_str
    end
    # p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
    # p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
    # p "HELLOworld".select          # => ""
    
    def map!(&prc)
        prc ||= Proc.new{|char, index| char}
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end
        return self
    end

end


# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"




