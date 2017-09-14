def anagram_phase_one(word, anagram) #running time of o(n!)
  permutations = word.chars.permutation.to_a
  permutations.include?(anagram.chars)
end

def anagram_phase_two(word, anagram) #running time of o(n^3)
  word_letters = word.chars
  anagram_letters = anagram.chars

  word.each_char.with_index do |letter1, idx1|
    anagram.each_char.with_index do |letter2, idx2|
      if letter1 == letter2
        word_letters.delete(letter1)
        anagram_letters.delete(letter2)
      end
    end
  end
  word_letters.empty? && anagram_letters.empty?
end

def anagram_phase_three(word, anagram) #running time of nlogn usually
  word.chars.sort == anagram.chars.sort
end

def anagram_phase_four(word, anagram) #running time of o(n)
  hash = Hash.new(0)

  word_letters = word.chars
  anagram_letters = anagram.chars

  word_letters.each do |letter|
    hash[letter] += 1
  end

  anagram_letters.each do |letter|
    hash[letter] -= 1
  end

  hash.all? {|k, v| v == 0}
end
