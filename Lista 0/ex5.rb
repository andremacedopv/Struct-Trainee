# Exericio 5 - Lista 0

# Read grade
puts "Insira sua nota:"
grade = gets.to_f

# Print mention
if grade < 0 || grade > 10
    puts "Nota Inválida"
elsif grade == 0
    puts "SR"
elsif grade < 3
    puts "II"
elsif grade < 5
    puts "MI"
elsif grade < 7
    puts "MM"
elsif grade < 9
    puts "MS"
else
    puts "SS"
end