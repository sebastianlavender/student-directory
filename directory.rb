#creates a blank array and then asks the user to input names
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

#prints header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#filters by starting letter of the names
def filter_letter(students)
  puts "Do you want filter by starting letter? (yes/no)"
  input = gets.chomp

  if input == "yes"
    puts "Please enter the letter"
    letter = gets.chomp
    students.select! { |student| student[:name].chars.first == letter }
  end
  students
end

#prints student names with number added
def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#prints footer
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#nothing happens till we run the methods
students = input_students
students = filter_letter(students)
print_header
print(students)
print_footer(students)
