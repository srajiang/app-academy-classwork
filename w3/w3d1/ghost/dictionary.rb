require "set"
file = File.open("dictionary.txt")
file_data = file.readlines.map(&:chomp)
$DICT = file_data.to_set
file.close