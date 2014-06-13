longest_anagram
===============

This is my assignment for the summer internship.

===============
[THE PROBLEM]

Write a program that, given 16 characters, finds the longest possible word that can be made from those characters without trying all 2^16 possible sets of letters.


===============
[IMPORTANT NOTE TO CODE REVIEWERS]

I have three versions of programs, "anagram_newest.rb"(which is not the newest), "anagram_OOP.rb" and "activerecord".

"anagram_OOP.rb" is the fastest so far and takes the userinput correctly, so please check this out if you want to see only one of them.

I coded everything in Ruby. I am planning to re-code them in Python later in this internship period.

Since I had a problem loading the dictionary given, I used the dictionary in my computer. I have the text file based on my dictionary in the necessary folders, so you will be able to run all three programs without trouble.


================
[HOW TO RUN THE CODE]

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
[MY APPROACH TO THIS PROBLEM]


