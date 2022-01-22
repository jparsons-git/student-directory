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

# Uncomment the predefined cohort choices for user selection
cohorts = [
  {cohort: :january, default: false}, 
  {cohort: :march, default: true}, 
  {cohort: :may, default: false}, 
  {cohort: :july, default: false}, 
  {cohort: :september, default: false}, 
  {cohort: :november, default: false}
  ]
 
def input_students(months)
  puts "Please enter the names of the students"
  puts "To finish, just hot return twice"
  # initialise an empty students array
  students = []
  # get the first name
  name = gets.chomp
  # while name is not empty... repeat 
  while !name.empty? do
    
    # select the cohort
    valid = false
    chosen_month = ""
    default_month = ""
    while !valid do
      puts "Please select the month of the cohort from the following: "
      months.each do |month|
        # output the options, and derive the default month
        if month[:default]
          puts "#{month[:cohort]} (default month)"
          default_month = month[:cohort]
        else
          puts "#{month[:cohort]}"
        end  
      end
      # get/map the availble months for the cohorts
      months_available = months.map { |month| month[:cohort] }
      chosen_month = gets.chomp
      if months_available.include? (chosen_month.to_sym)  
        valid = true
      elsif chosen_month == ""
        valid = true
        # use the default month here
        chosen_month = default_month
        puts "use the default month of #{default_month}"
      else
        puts "#{chosen_month} is NOT ncluded in the above list - please try again"
      end 
    end
    
    # enter hobby
    valid = false
    while !valid do
      puts "Please enter your hobby"
      hobby = gets.chomp
      if hobby != ""
        valid = true
      end  
    end
    
    # enter country of birth
    valid = false
    while !valid do
      puts "Please enter your Country of Birth"
      cob = gets.chomp
      if cob != ""
        valid = true
      end  
    end
    
    # enter height
    valid = false
    while !valid do
      puts "Please enter your height"
      height = gets.chomp
      if height != ""
        valid = true
      end  
    end
    
    students << {name: name, cohort: chosen_month.to_sym, hobby: hobby, cob: cob, height: height}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # finally return the array of students
  students
end 

def select_on_cohort(students)
  # firstly find the distinct cohort values
  cohorts_available = students.map { |student| student[:cohort] }.uniq 
  valid = false
  
  while !valid do
    puts "Please select the cohort from the following list"
    cohorts_available.each do |option|
      puts option
    end  
    cohort = gets.chomp
    if cohorts_available.include? (cohort.to_sym)  
      valid = true
    else
      puts "#{cohort} is NOT ncluded in the above list - please try again"
    end  
  end
  # todo I feel sure this can be done more succinctly without the "each" loop - come back to this
  selected_students = []
  students.each do |student|
    if student[:cohort].to_s == cohort
      selected_students.push(student)
    end  
  end 
  return selected_students
end 

def print_by_cohort(students, widths)
  # firstly find the distinct cohort values
  cohorts_available = students.map { |student| student[:cohort] }.uniq
  
  grouped_students = []
  cohorts_available.each do |cohort|
    #puts "THIS IS THE COHORT #{cohort}"
    grouped_students = []
    students.each do |student|
      #puts "THIS IS THE STUDENT'S COHORT #{student[:cohort]}"
      if student[:cohort] == cohort
        #puts "DO WE HAVE A MATCH on #{cohort}"
        grouped_students.push(student)
      end
    end
    print(grouped_students, widths)
    puts grouped_students.count > 1 ? "In the #{cohort} cohort, we have #{grouped_students.count} great students".center(find_total_width(students), ' ')
                                    : "In the #{cohort} cohort, we have #{grouped_students.count} great student".center(find_total_width(students), ' ')
    #puts "In the #{cohort} cohort, we have #{grouped_students.count} great students".center(find_total_width(students), ' ') :
    puts  
  end  
end  

def print_header(students)
  puts "The students of Villains Academy".center(find_total_width(students), ' ')
  puts "--------------------------------".center(find_total_width(students), ' ')
end

def print(students, widths)
  name_col = "NAME"
  cohort_col = "COHORT"
  hobby_col = "HOBBY"
  cob_col = "COUNTRY"
  # output the column headings
  puts "#{name_col.center(widths[0], ' ')} #{cohort_col.center(18, ' ')} #{hobby_col.center(widths[2], ' ')} #{cob_col.center(widths[3], ' ')} HEIGHT"
 # and now all the student information  
  ind = 0
  while ind < students.count do
    student = students[ind]
    # build the cohort string inbetween brackets with the static word "cohort"
    cohort = "(#{student[:cohort].to_s} cohort)"
    puts "#{student[:name].center(widths[0], ' ')} #{cohort.center(18, ' ')} #{student[:hobby].center(widths[2], ' ')} #{student[:cob].to_s.center(widths[3], ' ')} #{student[:height]}"
    ind += 1
  end    
end

def print_footer(names)
  puts names.count > 1 ? "Overall, we have #{names.count} great students".center(find_total_width(names), ' ')
                       : "Overall, we have #{names.count} great student".center(find_total_width(names), ' ')
end

def find_column_width(students)
  # find the maximum width of each column from the contents
  max_name = 4
  max_hobby = 5
  max_cob = 7
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
  # hardcode the width for the COHORT column and the HEIGHT column as is constant
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

# Comment out the interactive user input for student for excercise 8
students = input_students(cohorts)
# Comment out the print by user selected cohort
# students_to_list = select_on_cohort(students)
widths = []
widths=find_column_width(students) # get the widths dynamically according to full list od students 
print_header(students)
# Comment out the print by selected list
# print(students_to_list)
print_by_cohort(students, widths)
print_footer(students)
