# put all the students into an array
students = [
  {name: "Dr. Hannibal Lector", cohort: :november, hobby: "Eating", cob: :USA, height: "6'"},
  {name: "Darth Vader", cohort: :november, hobby: "Destruction", cob: :USA, height: "5' 8"},
  {name: "Nurse Ratched", cohort: :may, hobby: "Caring", cob: :Canada, height: "5' 5"},
  {name: "Michael Corleone", cohort: :november, hobby: "Eating", cob: :England, height: "5' 11"},
  {name: "Alex DeLarge", cohort: :september, hobby: "Eating", cob: :Denmark, height: "6' 5"},
  {name: "The Wicked Witch of the West", cohort: :november, hobby: "Flying", cob: :USA, height: "5' 5"},
  {name: "Terminator", cohort: :may, hobby: "Flying", cob: :Sweden, height: "5' 10"},
  {name: "Freddie Krueger", cohort: :november, hobby: "Eating", cob: :Australia, height: "5' 9"},
  {name: "The Joker", cohort: :may, hobby: "Card Playing", cob: :Canada, height: "4' 9"},
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
    
    valid = false
    while !valid do
      puts "Please select your cohort - november, may or september - no entry will default to november"
      cohort = gets.chomp
      if cohort == "november" || cohort == "may" || cohort == "september"
        valid = true
      elsif cohort == ""
        valid = true
        cohort = "november"
        puts "Defaulted to november"
      else
        # do nothing - go roung again until valid entry
      end  
    end
    
    valid = false
    while !valid do
      puts "Please enter your hobby"
      hobby = gets.chomp
      if hobby != ""
        valid = true
      end  
    end
    
    valid = false
    while !valid do
      puts "Please enter your Country of Birth"
      cob = gets.chomp
      if cob != ""
        valid = true
      end  
    end
    
    valid = false
    while !valid do
      puts "Please enter your height"
      height = gets.chomp
      if height != ""
        valid = true
      end  
    end
    
    students << {name: name, cohort: cohort.to_sym, hobby: hobby, cob: cob, height: height}
    puts "Now we have #{students.count} students"
    # get another name from thu user
    name = gets.chomp
  end
  # finally return the array of students
  students
end    

def find_column_width(students)
  # find the maximum width of the variable sized columns from the contents
  max_name = 0
  max_hobby = 0
  max_cob = 0
  students.each do |student|
    if student[:name].length > max_name
      max_name = student[:name].length
    end
    if student[:hobby].length > max_hobby
      max_hobby = student[:hobby].length
    end
    if student[:cob].length > max_cob
      max_cob = student[:cob].length
    end  
  end
  # hardcode the width for the HEIGHT column and the COHORT column as constants
  return [max_name, 18, max_hobby, max_cob, 6]
end  

def find_total_width(students)
  # derive the total width of the table of information - so enable centralising it
  total_width = 0
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
  puts "#{name_col.center(find_column_width(students)[0], ' ')} #{cohort_col.center(18, ' ')} #{hobby_col.center(find_column_width(students)[2], ' ')} #{cob_col.center(find_column_width(students)[3], ' ')} HEIGHT"
 # and now all the student information  
  ind = 0
  while ind < students.count do
    student = students[ind]
    # build the cohort string inbetween brackets with the static word "cohort"
    cohort = "(#{student[:cohort].to_s} cohort)"
    puts "#{student[:name].center(find_column_width(students)[0], ' ')} #{cohort.center(18, ' ')} #{student[:hobby].center(find_column_width(students)[2], ' ')} #{student[:cob].to_s.center(find_column_width(students)[3], ' ')} #{student[:height]}"
    ind += 1
  end    
end 

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(find_total_width(names), ' ')
end

# UNComment out the interactive user input for student for excercise 7
students = input_students
print_header(students)
print(students)
print_footer(students)