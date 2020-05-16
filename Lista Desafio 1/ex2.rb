# Exericio 2 - Lista Desafio 1

# Function to check divisors of a number
def checkDivisors (number)
    divisors = []
    for i in 1..number
        if number % i == 0
            divisors.push(i)
        end
    end
    return divisors
end

# Get number
puts "Insira um número para verificar se é primo:"
number = gets.to_i

# Verify if its prime
divisors = checkDivisors(number)
if divisors.empty?
    puts "Entrada inválida"
elsif divisors.length < 3 # Divisores são 1 e ele mesmo
    puts "#{number} é primo!"
else
    print "#{number} não é primo, pois tem #{divisors.length} divisores: #{divisors}\n"
end