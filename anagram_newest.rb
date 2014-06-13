
class Word
  attr_accessor :name, :sorted
  def initialize(name)
    @name = name
    @sorted = name.split(//).sort.join("")
  end
end


def load_from_txt
  @words = []
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




@result = []

def return_perf_anagram(word)
    sorted_word = word.split(//).sort.join("")
	  @words.each do |word_from_d|
	    if word_from_d.sorted == sorted_word
	      @result << word_from_d.name
	    end
  	end
  @result
end




def helper_anagram(word, n)
  if n == word.length
    return nil
    
  else
    if @result != []
      return @result
      
    else
      drop_n_chs_arr(word, n).each do |short_word|
        return_perf_anagram(short_word)
      end
      helper_anagram(word, n+1)
    end
  end

end


def find_longest_anagram(word)
  return_perf_anagram(word)
  helper_anagram(word, 1)
end



# load_from_txt
# find_longest_anagram("parameters")

# def find_longest_anagram(word)
#   return_perf_anagram(word)
#   if @result != []
#     @result
#   else
#     drop_n_chs_arr(word, 1).each do |short_word|
#       return_perf_anagram(short_word)
#     end
#     if !@result == []
#       @result
#     else
#       drop_n_chs_arr(word, 2).each do |shorter_word|
#         return_perf_anagram(shorter_word)
#       end
#       if !@result == []
#         @result
#       else
#         drop_n_chs_arr(word, 3).each do |shorter_shorter_word|
#           return_perf_anagram(shorter_shorter_word)
#         end
#         if !@result == []
#       end
#   end
# end

load_from_txt
p find_longest_anagram("phylosophicalaol")