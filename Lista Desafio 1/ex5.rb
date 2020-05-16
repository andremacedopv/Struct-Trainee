# Exericio 5 - Lista Desafio 1

# Read candles quantity
puts "Insira a quantidade de velas:"
candles = gets.to_i

# Iterate to find amount of hours
if candles <= 0
    puts "Entrada inválida"
else
    hours = 0
    burned = 0
    while candles >= 1
        hours += candles
        burned += candles
        if burned % 2 == 0
            candles = burned/2
            burned = 0
        else
            candles = (burned-1)/2
            burned = 1
        end
    end
    puts "#{hours} horas."
end