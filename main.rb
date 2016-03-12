require 'set'
require './books.rb/david-copperfield.rb'
require './books.rb/hard-times.rb'
require './books.rb/oliver-twist.rb'


class WordFilter
  def initialize
    @word_set = Set.new
  end

  def get_words(str)
    str.scan(/[a-zA-Z]+'?[a-z]*/).each do |m|
      @word_set.add(m)
    end
  end

  def filter
    while line=gets
      line_valid = true
      line.split.each do |word|
        line_valid = false if @word_set.include? word
      end
      puts line if line_valid
    end
  end
end

filter = WordFilter.new

filter.get_words DAVID_COPPERFIELD
filter.get_words HARD_TIMES
filter.get_words OLIVER_TWIST

filter.filter
