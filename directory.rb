# put all the students into an array
students = [
  {name: "Dr. Hannibal Lector", cohort: :november, hobby: "Eating", cob: :USA, height: "6'"},
  {name: "Darth Vader", cohort: :november, hobby: "Destruction", cob: :USA, height: "5' 8"},
  {name: "Nurse Ratched", cohort: :november, hobby: "Caring", cob: :Canada, height: "5' 5"},
  {name: "Michael Corleone", cohort: :november, hobby: "Eating", cob: :England, height: "5' 11"},
  {name: "Alex DeLarge", cohort: :november, hobby: "Eating", cob: :Denmark, height: "6' 5"},
  {name: "The Wicked Witch of the West", cohort: :november, hobby: "Flying", cob: :USA, height: "5' 5"},
  {name: "Terminator", cohort: :november, hobby: "Flying", cob: :Sweden, height: "5' 10"},
  {name: "Freddie Krueger", cohort: :november, hobby: "Eating", cob: :Australia, height: "5' 9"},
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

def find_column_width(students)
  # find the maximum width of each column from the contents
  max_name = 0
  max_cohort = 0
  max_hobby = 0
  max_cob = 0
  students.each do |student|
    if student[:name].length > max_name
      max_name = student[:name].length
    end
    if student[:cohort].length > max_cohort
      max_cohort = student[:cohort].length
    end
    if student[:hobby].length > max_hobby
      max_hobby = student[:hobby].length
    end
    if student[:cob].length > max_cob
      max_cob = student[:cob].length
    end  
  end
  # hardcode the width for the HEIGHT column as is constant
  return [max_name, max_cohort, max_hobby, max_cob, 6]
end  

def find_total_width(students)
  # toso - come back to this later to see if this can be more succinct
  total_width = 9  # to add the extra width for the word "cohort"
  find_column_width(students).each do |width|
    total_width += width + 1
  end
  return total_width
end 

def print_header(students)
  puts "The students of Villains Academy".center(find_total_width(students), ' ')
  puts "--------------------------------".center(find_total_width(students), ' ')
end

def print(students)
  name_col = "NAME"
  cohort_col = "COHORT"
  hobby_col = "HOBBY"
  cob_col = "COUNTRY"
  # output the column headings
  puts "#{name_col.center(find_column_width(students)[0], ' ')} #{cohort_col.center(17, ' ')} #{hobby_col.center(find_column_width(students)[2], ' ')} #{cob_col.center(find_column_width(students)[3], ' ')} HEIGHT"
  # and now all the student information  
  ind = 0
  while ind < students.count do
    student = students[ind]
    puts "#{student[:name].center(find_column_width(students)[0], ' ')} (#{student[:cohort].to_s.center(find_column_width(students)[1], ' ')} cohort) #{student[:hobby].center(find_column_width(students)[2], ' ')} #{student[:cob].to_s.center(find_column_width(students)[3], ' ')} #{student[:height]}"
    ind += 1
  end    
end 

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(find_total_width(names), ' ')
end

# Comment out the interactive user input for student for no
# students = input_students
print_header(students)
print(students)
print_footer(students)