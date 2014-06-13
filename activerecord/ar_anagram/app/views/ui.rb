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