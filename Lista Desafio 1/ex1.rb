# Exericio 1 - Lista Desafio 1

# Function to calcutlate the fatorial
# First parameter is the number to calculate
# Second parameter is to print the calculation
def calcFatorial(number, show)
    # Stop condition 
    if number <= 0
        return 1
    else
        # Print if needed
        if show == true && number == 1
            print "#{number}"
        elsif show == true
            print "#{number}*"
        end

        # Calculate via recursion
        return (number * calcFatorial(number-1, show))
    end
end


# Get number
puts "Insira um número para o cálculo do fatorial:"
number = gets.to_i

# Make the fatorial
if number < 0
    puts "Entrada inválida"
else
    print "#{number}! = "
    case number
    when 1..10
        fat = calcFatorial(number, true)
        print " = #{fat}\n"
    else
        fat = calcFatorial(number, false)
        print "#{fat}\n"
    end
end