class Word < ActiveRecord::Base
  before_create :add_letters
  def self.find_anagrams(string)
    letters = string.split(//)
    anagrams = []
    letters.each do |letter|
      remaining = letters.select { |l| l != letter }
      potential_anagram = letter + reverse_letters(remaining).join('')
      potential_anagrams = []
      potential_anagrams << letter + remaining.join('')
      potential_anagrams << letter + reverse_letters(remaining).join('')
      potential_anagrams.each do |potential_anagram|
        if self.find_by_text(potential_anagram).present?
          anagrams << potential_anagram
        end
      end
    end
    anagrams
  end
  def self.reverse_letters(letters)
    length = letters.length
    reversed_letters = Array.new(length)
    letters.each_with_index do |letter, index|
      reversed_letters[length - index - 1] = letter
    end
    reversed_letters
  end
  def add_letters
    characters = self.text.chars
    alphabetized_characters = characters.sort
    self.letters = alphabetized_characters.join
end
