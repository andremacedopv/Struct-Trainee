# Exericio 8 - Lista 0

# Function to verify parity
def isEven? (number)
    if (number % 2) == 0
        return true
    else
        return false
    end
end

# Get number
puts "Insira um inteiro:"
number = gets.to_i

# Verify parity
if isEven? (number)
    puts "#{number} é Par"
else
    puts "#{number} é Ímpar"
end