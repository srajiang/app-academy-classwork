class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length,'_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index {|ele, i| indices << i if ele == char }
    indices
  end

  def fill_indices(char, indices)
    indices.each {|i| @guess_word[i] = char}
  end

  def try_guess(char)
    if self.already_attempted?(char)
      print 'that has already been attempted'
      return false
    end
    @attempted_chars << char
    indices = self.get_matching_indices(char)
    indices.empty? ? @remaining_incorrect_guesses -= 1 : fill_indices(char, indices)
    true
  end

  def ask_user_for_guess
    p 'Enter a char:'
    input = gets.chomp
    self.try_guess(input)
  end
  
  def win?
    if @guess_word.join("") == @secret_word
      p 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      true
    else
      false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      true
    else
      false
    end
  end

end
