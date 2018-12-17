#puts students into an array storing name and cohort in hashs
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

#prints header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#prints student names
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#prints footer
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#nothing happens till we run the methods
print_header
print(students)
print_footer(students)
