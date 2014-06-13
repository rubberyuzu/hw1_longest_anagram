# ===================MODEL==================
class Word
  attr_accessor :name, :sorted
  def initialize(name)
    @name = name
    @sorted = name.split(//).sort.join("")
  end
end

class Anagram
	def initialize
		@result = []
		@words = []
		load_from_txt
	end

	def load_from_txt
	  File.readlines('dictionary.txt').each do |line|
	    @words << Word.new(line.downcase.chomp)
	  end
	end


	def drop_one_ch(word, index)
	  sorted_word = word.split(//).sort.join("")
	  sorted_word[index]=""
	  sorted_word
	end


	def drop_one_ch_arr(word)
	  @short_word_arr = []
	    for i in 0..word.length-1
	      @short_word_arr << drop_one_ch(word, i)
	    end
	  @short_word_arr
	end


	def drop_n_chs_arr(word, n)
	  if n == 0
	    [word]
	  elsif n == 1
	    drop_one_ch_arr(word)
	  else
	    @combined_arr = []
	    drop_n_chs_arr(word, n-1).each do |short_word|
	      @combined_arr << drop_one_ch_arr(short_word)
	    end
	    @combined_arr.flatten.uniq.select{|x| x.length==word.length-n}
	  end
	end

	def return_perf_anagram(word)
	    sorted_word = word.split(//).sort.join("")
		  @words.each do |word_from_d|
		    if word_from_d.sorted == sorted_word
		      @result << word_from_d.name
		    end
	  	end
	  	@result.uniq!
	end

	def helper_anagram(word, n)
	  if n == word.length
	    return []
	    exit
	  else
	    if @result != []
	      return @result
	      exit
	    else
	      drop_n_chs_arr(word, n).each do |short_word|
	        return_perf_anagram(short_word)
	      end
	      return helper_anagram(word, n+1)
	    end
	  end

	end

	def find_longest_anagram(word)
	  return_perf_anagram(word)
	  return helper_anagram(word, 1)
		# p word
	end
	
end

# ==================VIEW=================
class View
	def self.each_show(answer_array)
		if answer_array != []
			puts "Your longest anagram(s) is..."
			answer_array.each do |el|
				p el 
			end
		else
			p "nothing found."
		end
	end
end
# ==================CONTROLLER==============

class Controller
	def self.run
	  userinput= ARGV[0]
	  anagram = Anagram.new
	  anagram.load_from_txt
		result_arr = anagram.find_longest_anagram(userinput)
		View.each_show(result_arr)
	end

end

Controller.run


