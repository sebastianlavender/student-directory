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

#prints header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#prints student names
def print(names)
  names.each do |name|
  puts name
end

#prints footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens till we run the methods
print_footer
print(students)
print_footer
