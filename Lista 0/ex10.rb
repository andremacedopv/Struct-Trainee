# Exericio 10 - Lista 0

# Read integers
puts "Insira 10 números separados por espaço:"
string = gets.chomp
array = string.split.map(&:to_i) # convert string into array of chars

# Verify ones in range
in_range = 0
for i in 0..9
    if (array[i] >= 10) && (array[i] <= 20)
        in_range += 1
    end
end

# Print result
puts "#{in_range} estão no intervalo [10,20], #{10 - in_range}, fora"