#longest_anagram
===============

This is my assignment for the summer internship.

===============
## THE PROBLEM

Write a program that, given 16 characters, finds the longest possible word that can be made from those characters without trying all 2^16 possible sets of letters.


===============
## IMPORTANT NOTE TO CODE REVIEWERS

I have three versions of programs, "anagram_newest.rb"(which is not the newest), "anagram_OOP.rb" and "activerecord".

"anagram_OOP.rb" is the fastest so far and takes the userinput correctly, so please check this out if you want to see only one of them.

I coded everything in Ruby. I am planning to re-code them in Python later in this internship period.

Since I had a problem loading the dictionary given, I used the dictionary in my computer. I have the text file based on my dictionary in the necessary folders, so you will be able to run all three programs without trouble.


================
## HOW TO RUN THE CODE


"anagram_newest.rb" --- on commandline, type "ruby anagram_newest.rb"

This code does not take userinput, so I have the test example in the file itself. You can edit the last line of the file and run it to see if it's actually working.



"anagram_OOP.rb" --- on commandline, type "ruby anagram_OOP.rb [yourinput]".

ex.) ruby anagram_OOP.rb yuzusaijo

Then you will see the longest anagram(s) possible.
It might take time, because this file is loading the dictionary file every time.



"activerecord" --- on commandline, make sure you're using Ruby 1.9.3, and type "bundle".

After that, type "rake db:create", "rake db:migrate",
"rake db:seed" to create and populate the database.

Then you'll be able to run the program by typing "ruby anagram.rb [yourinput]"

(This might take a bit longer than "anagram_OOP.rb" somehow)



Thanks for the code review, and I appreciate any kind of feedback!


===============
## MY APPROACH TO THIS PROBLEM

What would be the worst case of this problem? => The case when you cannot find the anagram at all. 
... in that case, you have to search for all the 2^16 possibilities; this cannot be avoided.


=> start from looking for the longest anagram possible, and then stop the calculation!



## MY LOGIC

look for the 'perfect' anagram first, (= defined as "return_perf_anagram" method in my code)

=> if there's the perfect anagram, show it and stop all the rest of the program.
if not, drop one character (= defined as "drop_one_ch" => loop using "drop_one_ch_arr") and try looking for the perfect anagram for that word.

=> repeat this process using RECURSION!



## A FEW WORDS ABOUT METHODS

find_longest_anagram ... the main method which takes the userinput and returns the answer as an array.

helper_anagram ... the part of code which is repeated and called in the process of recursion. the base case is the first condition.

drop_one_ch ... takes a word and an index and drop one character at that index

drop_one_ch_arr ... takes a word and returns an array of the words missing one character

drop_n_chs_arr ... takes a word and the number of characters you want to drop, and returns an array of all the possible words missing n characters


# REFLECTION AND FUTURE IMPROVEMENT

Though the main purpose of this problem was to speed up the program, my program turned out to be slower than I expected.

Some possible causes would be: 1) loading the dictionary every time, 2) accessing the database is taking time somehow(?)

Also, the sorting process is taking much time, though the sorting is not considered in this problem, given that the problem is saying "without trying 2^16 possibilities" instead of just saying "Speed up your code."

In that sense I've already solved this problem, succeeding in getting the result without trying all the possibilities.
However, I would like to speed up the process more.

In order to achieve this, I would like to speed up the process of sorting.

For example, it might be a good idea to assign a prime number for each alphabet instead of sorting. That way, you can look for anagram just by comparing the product of each prime numbers.

Also, as I mentioned earlier in this file, I would like to re-write the code in other languages, too.

I hope to have time to reflect back on this exciting problem again, and it was really fun to work on this!

Thanks again.