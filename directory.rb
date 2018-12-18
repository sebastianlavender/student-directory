def interactive_menu
  @students = [] #an empty array accessible to all methods
  loop do
    print_menu
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "9"
        exit #this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end
end

# Print the menu and ask the user what to do
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

#prints a list of students
def show_students
  print_header
  print_students_list
  print_footer
end

#creates a blank array and then asks the user to input names
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

#prints header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#prints student names with number added
def print_students_list
  @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#prints footer
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

#saves students to a file
def save_students
  #open file for writing
  file = File.open("students.csv", "w")
  #iterate over array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

#nothing happens till we run the methods
interactive_menu
