#puts students into an array
students = [
"Dr. Hannibal Lecter",
"Darth Vadar",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Kreuger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]

#prints the students out
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end

#finally, we print the number of students
puts "Overall, we have #{students.count} great students"
