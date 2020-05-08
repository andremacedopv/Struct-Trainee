# Exericio 7 - Lista 0

# Get number
number = 0
while (number < 1) || (number > 10)
    puts "Digite um número entre 1 e 10:"
    number = gets.to_i
end

# Print table
for i in 1..10
    print "#{number * i}"
    unless i == 10
        print ", "
    end
end
print "\n"