# Exericio 17 - Lista 0

# Get value
puts "Insira valor inteiro para ser sacado:"
value = gets.to_i

# Initialize bills
bill_100 = 0
bill_50 = 0
bill_20 = 0
bill_10 = 0
bill_5 = 0
bill_2 = 0

# Verify how to give the money
while value > 1
    case
    when value >= 100
        value -= 100
        bill_100 += 1
    when value >= 50
        value -= 50
        bill_50 += 1
    when value >= 20
        value -= 20
        bill_20 += 1
    when value >= 10
        value -= 10
        bill_10 += 1
    when value >= 5
        value -= 5
        bill_5 += 1
    when value >= 2
        value -= 2
        bill_2 += 1
    end
end

# Print bills to be handed
puts "#{bill_100} nota(s) de 100"
puts "#{bill_50} nota(s) de 50"
puts "#{bill_20} nota(s) de 20"
puts "#{bill_10} nota(s) de 10"
puts "#{bill_5} nota(s) de 5"
puts "#{bill_2} nota(s) de 2"
puts "Resto: #{value}"