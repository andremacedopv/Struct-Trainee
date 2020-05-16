# Exericio 4 - Lista Desafio 1

# Read sides values
puts "Insira os valores dos lados do triângulo:"
sides_str = gets.chomp
sides = sides_str.split.map(&:to_i)

# Verify type of triangle
# Verify sides values are valid
if sides.all? { |number| number > 0}
    # Verify equilateral
    if sides[0] == sides[1] && sides[0] == sides[2]
        puts "Forma triângulo equilátero"
    else
        # Verify triangle validity
        sum_0_1 = sides[0] + sides[1]
        sum_0_2 = sides[0] + sides[2]
        sum_1_2 = sides[1] + sides[2]
        if (sum_0_1 > sides[2]) && (sum_0_2 > sides[1]) && (sum_1_2 > sides[0])
            # Verify Isoceles or Scalene
            if (sides[0] == sides[1]) || (sides[0] == sides[2]) || (sides[1] == sides[2])
                puts "Forma triângulo isósceles"
            else
                puts "Forma triângulo escaleno"
            end
        else
            puts "Não forma triângulo"
        end
    end
else
    puts "Entrada inválida"
end