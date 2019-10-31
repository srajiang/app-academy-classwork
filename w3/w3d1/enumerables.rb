class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i]) 
      i += 1
    end
    self
  end

  def my_select(&prc)
    selected = []
		self.my_each do |ele|
      selected << ele if prc.call(ele)  #---- and with an implicit block passed in.
    end
    selected
	end

  def my_reject(&prc)
    selected = self.my_select(&prc)
    self - selected
  end

  def my_any?(&prc)
    self.my_each do |ele|
        return true if prc.call(ele)
    end
    false
	end 

	def my_all?(&prc)
		self.my_each do |ele|
			return false if !prc.call(ele)
		end
		true
	end

  # def my_flatten
  #   puts "self is #{self}"

	# 	return [self] if !self.is_a?(Array)
	# 	flattened = []
	# 	#recursive action
  #   self.my_each do |ele|
  #     self.is_a?(Array)
  #     puts "ele is #{ele}"
  #     flattened += ele.my_flatten
  #     p "flattened is #{flattened}"
	# 	end
	# 	flattened
	# end
    
  def my_flatten
    puts "self is #{self}"
    return [self] if self.is_a?(Integer)
    return [] if self.empty?

    self[0].my_flatten + self[1..-1].my_flatten
	end
	
	def my_zip(*args)
		output = Array.new(self.length) {Array.new}
		# p output
    args.unshift(self)
		self.each_with_index do |ele, outer_idx|
      args.each do |arr|
        output[outer_idx] << arr[outer_idx]
      end
		end
	  output
  end

  def my_rotate(delta = 1)
    dub = self[0..-1]
    if delta > 0
      delta.times do 
        dub.push(dub.shift)
        
      end
    else
      (delta.abs).times do
        dub.unshift(dub.pop)
      end
    end
    dub
	end
	
	def my_join(sep = "")
		joined = ""
		self.each do |ele|
			joined << ele + sep
		end
		joined[-1] != self[-1] ? joined[0...-1] : joined
	end

	def my_reverse
		reversed = []
		self.length.times { reversed << self.pop } 
		reversed
	end

end

class Integer
	def my_flatten
		[self] if self.is_a?(Integer)
	end
end


if __FILE__ == $PROGRAM_NAME

p [ 1, 2, 3, 4].my_select {|ele| ele.even? }   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

end

