class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def initialize(arr)
    if !Code.valid_pegs?(arr)
      raise 'does not contain valid pegs'
    else 
      @pegs = arr.map {|char| char.upcase }
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    random = []
    length.times { random << POSSIBLE_PEGS.keys.sample }
    Code.new(random)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def [](index)
    self.pegs[index]
  end

  def length
    self.pegs.length
  end

  def num_exact_matches(guess)
    guess.pegs.each.with_index.count { |peg, i| peg == self.pegs[i] }
  end

  def num_near_matches(guess)
    my_pegs = self.pegs.dup
    guess_pegs = guess.pegs

    test_guess = []
    guess_pegs.each.with_index { |peg, i| test_guess << peg if peg != my_pegs[i] }
    
    near_matches = 0 
    test_guess.each do |peg| 
      self_index = my_pegs.index(peg)
      if self_index != nil
        my_pegs.delete_at(self_index)
        near_matches += 1
      end
    end
    near_matches
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end

end
