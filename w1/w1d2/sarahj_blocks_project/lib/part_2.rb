def all_words_capitalized?(words)
    words.all? {|word| word == word.downcase.capitalize }
end

def no_valid_url?(urls)
    valid = ['io', 'com', 'net', 'org']
    urls.none? do |url|
        valid.include?(url.split('.')[-1])
    end
end

def any_passing_students?(students)
    students.any? do |s| 
        s[:grades].sum / s[:grades].length.to_f > 75 
    end
end