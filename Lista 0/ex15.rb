# Exericio 15 - Lista 0

# Create hash
aluno = Hash.new

# Get info
puts "Digite o nome:"
aluno["nome"] = gets.chomp

puts "Digite a idade:"
aluno["idade"] = gets.to_i

puts "Digite a matrícula:"
aluno["matricula"] = gets.chomp

puts "Digite o e-mail:"
aluno["email"] = gets.chomp

# Print hash
puts aluno