def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit #this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end
end

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
    if student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

#prints footer
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#nothing happens till we run the methods
<<<<<<< HEAD
interactive_menu
=======
students = input_students
students = filter_letter(students)
print_header
print(students)
print_footer(students)
>>>>>>> be6683aa1047ec812a733553f19db36dc332358c
