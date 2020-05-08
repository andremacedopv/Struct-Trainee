# Exericio 2 - Lista 0

# Read string
puts "Digite uma string:"
string = gets.chomp

# Verify if contains non-ascii
if string.ascii_only?
    puts "Contém somente caracteres ASCII"
else
    puts "Contém caracteres não ASCII"
end