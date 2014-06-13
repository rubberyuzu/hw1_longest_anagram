require_relative '../models/anagram'
require_relative '../views/ui'

class Controller
	def self.run
	  userinput= ARGV[0]
	  anagram = Anagram.new
		result_arr = anagram.find_longest_anagram(userinput)
		View.each_show(result_arr)
	end
end
