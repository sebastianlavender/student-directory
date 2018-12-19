require "csv"

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
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "5. Filter students by letter"
  puts "9. Exit"
  puts "0. Debug"
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
      choose_load_file
    when "5"
      filter_by_letter
    when "9"
      exit #this will cause the program to terminate
    when "0"
      debug
    else
      puts "I don't know what you meant, try again".center(50)
  end
end

def debug
  File.open($0, "r").readlines.each do |line|
    puts line
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
  puts "Please enter the names of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  # get the first name
  name = (STDIN.gets.chomp)
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student(name)
    puts "Now we have #{@students.count} students".center(50)
    # get another name from the user
    name = (STDIN.gets.chomp)
  end
end

def add_student(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

#prints header
def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

#prints student names with number added
def print_students_list
  @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
end

#prints footer
def print_footer
  puts "Overall, we have #{@students.count} great students".center(50)
end

#saves students to a file
def save_students
  puts "Please enter the filename you wish to save".center(50)
  filename = (STDIN.gets.chomp)
  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      csv.puts [student[:name], student[:cohort]]
    end
  end
end

#loads the saved students file
def load_students(filename = "students.csv")
  @students = [] if @students.any?
  CSV.foreach(filename) do |line|
    name, cohort = line
    add_student(name, cohort)
  end
end

def choose_load_file
  puts "Please enter the filename you wish to load".center(50)
  filename = STDIN.gets.chomp
  file_exists(filename)
end

def file_exists(filename)
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}".center(50)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist.".center(50)
    false
  end
end

#checks to see if the filename exists
def try_load_students
  filename = ARGV.first# first argument from the command line
  return load_students if filename.nil?
  exit if file_exists(filename) == false
end

#filters students by staring letter
def filter_by_letter
    puts "Please enter the starting letter to filter by".center(50)
    letter = STDIN.gets.chomp
    @students.each_with_index do  |student, index|
      if student[:name].chars.first == letter
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
      end
    end
end

#nothing happens till we run the methods
try_load_students
interactive_menu
