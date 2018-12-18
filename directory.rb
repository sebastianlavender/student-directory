@students = [] #an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

# Print the menu and ask the user what to do
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
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
  name = (STDIN.gets.chomp)
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = (STDIN.gets.chomp)
  end
end

def add_student(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
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

#loads the saved students file
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end
  file.close
end

#checks to see if the filename exists
def try_load_students
  filename = ARGV.first# first argument from the command line
  load_students if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

#nothing happens till we run the methods
try_load_students
interactive_menu
