# put all the students into an array
students = [
  {name: "Dr. Hannibal Lector", cohort: :november, hobby: "Eating", cob: :USA, height: "6'"},
  {name: "Darth Vader", cohort: :november, hobby: "Destruction", cob: :USA, height: "5' 8"},
  {name: "Nurse Ratched", cohort: :november, hobby: "Caring", cob: :Canada, height: "5' 5"},
  {name: "Michael Corleone", cohort: :november, hobby: "Eating", cob: :England, height: "5' 11"},
  {name: "Alex DeLarge", cohort: :november, hobby: "Eating", cob: :Denmark, height: "6' 5"},
  {name: "The Wicked Witch of the West", cohort: :november, hobby: "Flying", cob: :USA, height: "5' 5"},
  {name: "Terminator", cohort: :november, hobby: "Flying", cob: :Sweden, height: "5' 10"},
  {name: "Freddie Krueger", cohort: :november, hobby: "Eating", cob: :Denmark, height: "5' 9"},
  {name: "The Joker", cohort: :november, hobby: "Card Playing", cob: :Canada, height: "4' 9"},
  {name: "Joffrey Baratheon", cohort: :november, hobby: "Eating", cob: :Sweden, height: "5' 5"},
  {name: "Norman Bates", cohort: :november, hobby: "Card Playing", cob: :USA, height: "6'"}
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
    puts "#{student[:name]} (#{student[:cohort]} cohort), #{student[:hobby]}, #{student[:cob]}, #{student[:height]}"
    ind += 1
  end    
end 

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Comment out the interactive user input for student for no
# students = input_students
print_header
print(students)
print_footer(students)
