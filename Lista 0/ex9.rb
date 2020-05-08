# Exericio 9 - Lista 0

# Function to verify parity
def isEven? (number)
    if (number % 2) == 0
        return true
    else
        return false
    end
end

# Get numbers and verify parity
puts "Insira 5 números:"
evens = 0
for i in 0..4
    number = gets.to_i
    if isEven? (number)
        evens += 1
    end
end

# Print result
puts "#{5 - evens} são ímpares e #{evens} são pares"