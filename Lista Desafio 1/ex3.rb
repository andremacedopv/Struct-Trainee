# Exericio 3 - Lista Desafio 1

# Read integer
puts "Insira o número correspondente a posição da sequência de Fibonacci:"
number = gets.to_i

# Get Fibonacci
if number <= 0
    puts "Entrada inválida."
else
    # Initial Fibonacci values
    first = 1
    second = 1
    for i in 1..(number-1)
        aux = second
        second += first
        first = aux
    end
    puts first
end