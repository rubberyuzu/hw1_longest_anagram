require 'active_record'
require_relative '../app/models/word'
# require_relative '../db/dictionary.txt'

module WordsImporter
  def self.import
      # word_file = APP_ROOT.join('db', 'dictionary.txt')
     word_file = File.dirname(__FILE__) + "/dictionary.txt"
     Word.transaction do
       File.open(word_file).each do |line|
         word = Word.create(name: line.downcase.chomp, sorted: line.downcase.chomp.split(//).sort.join(""))
         # words << word
       end
     end
  end
end

WordsImporter.import

# File.readlines('dictionary.txt').each do |line|
# 	  Word.create(name: line.downcase.chomp, sorted: line.downcase.chomp.split(//).sort.join(""))
# end