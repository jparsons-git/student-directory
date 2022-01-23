# Refactoring exercise
# For the puroses of this exercise, removing dynamic column widths, default cohort selection, the original "given" students array
# And for now, showing the students by cohorts... although I will plug in a way to do this using the new method show_students

@students = []
@col_titles = ["Name", "Cohort", "Hobby", "Country of birth", "Height"]
@col_widths = [45, 20, 20, 20, 10]  # for the purpose of refactoring, use static column lengths
@cohorts = [
  {cohort: :january, default: false}, 
  {cohort: :march, default: true}, 
  {cohort: :may, default: false}, 
  {cohort: :july, default: false}, 
  {cohort: :september, default: false}, 
  {cohort: :november, default: false}
  ]
  
def input_students(months)
  puts "Please enter the name(s) of the student(s). To finish, just hit return twice"
  students = @students
  name = gets.chomp
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
          puts "      #{month[:cohort]} (default month)"
          default_month = month[:cohort]
        else
          puts "      #{month[:cohort]}"
        end  
      end
      # get/map the availble months for the cohorts
      months_available = months.map { |month| month[:cohort] }
      chosen_month = gets.chomp
      if months_available.include? (chosen_month.to_sym)  
        valid = true
      elsif chosen_month == ""
        valid = true # use the default month here
        chosen_month = default_month
        puts "#{default_month} (default) selected"
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
     
    # enter Country of birth  
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
    puts "Please enter the name of the another student, or to finish just hit enter"
    name = gets.chomp  # get another name from the user or finish 
  end
  return students  # finally return the array of students
end 

def interactive_menu
  students = @students
  loop do
    print_menu # list the options for the user
    selected = gets.chomp
    case selected # now put into action the user's selection
    when "1"
      students = input_students(@cohorts)
    when "2"
      if students.count > 0
        show_students(students)
      end
    when "9"
      exit
    else
      puts "Option not available, please try again"
    end  
  end  
end 

def print_menu
  puts "1. Input students"
  puts "2. Show students"
  #puts "3. Show given students"
  #puts "4. Show given students by cohort"
  puts "9. Exit"
end  

def show_students(students)
  print_header
  print(students)
  print_footer(students)
end  

def print_header()
  puts"start header"
  total_width = 0
  @col_widths.each do |width| total_width += width end
  puts "The students of Villains Academy".center(total_width, ' ')
  puts "--------------------------------".center(total_width, ' ')
end

def print(students)
  # output the column headings
  puts "#{@col_titles[0].center(@col_widths[0], ' ')} #{@col_titles[1].center(@col_widths[1], ' ')} #{@col_titles[2].center(@col_widths[2], ' ')} #{@col_titles[3].center(@col_widths[3], ' ')} #{@col_titles[4]}"
 # and now all the student information  
  ind = 0
  while ind < students.count do
    student = students[ind]
    # build the cohort string inbetween brackets with the static word "cohort"
    cohort = "(#{student[:cohort].to_s} cohort)"
    puts "#{student[:name].center(@col_widths[0], ' ')} #{cohort.center(@col_widths[1], ' ')} #{student[:hobby].center(@col_widths[2], ' ')} #{student[:cob].to_s.center(@col_widths[3], ' ')} #{student[:height]}"
    ind += 1
  end    
end

def print_footer(names)
  total_width = 0
  @col_widths.each do |width| total_width += width end
  puts names.count > 1 ? "Overall, we have #{names.count} great students".center(total_width, ' ')
                       : "Overall, we have #{names.count} great student".center(total_width, ' ')
end