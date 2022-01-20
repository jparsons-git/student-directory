# put all the students into an array
students = [
  {name: "Dr. Hannibal Lector", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddie Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hot return twice"
  # initialise an empty students array
  students = []
  # get the first name
  name = gets.chomp
  # while name is not empty... repeat 
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from thu user
    name = gets.chomp
  end
  # finally return the array of students
  students
end    


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  ind = 0
  while ind < students.count do
    student = students[ind]
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    ind += 1
  end    
end 

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
