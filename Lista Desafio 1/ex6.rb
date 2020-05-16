# Exericio 6 - Lista Desafio 1

# Read values
print "Valor aplicado: "
applied = gets.to_f
print "Rendimento mensal: "
income = gets.to_f
print "Conta de luz: "
bill = gets.to_f
print "Prazo: "
period = gets.to_i

# Verify time to pay electric bill
if (applied <= 0) || (income <= 0) || (bill <= 0) || (period <= 0)
    puts "Entrada inválida"
else
    # Initialize values
    rendiment = applied * income
    profit = rendiment
    months = 1

    while profit < bill
        months += 1
        applied += rendiment
        rendiment = applied * income
        profit += rendiment
        bill *= 1.01
    end

    # Verfy if months are inside especified period
    if months > period
        puts "Não foi atingindo o lucro necessário dentro do prazo."
        puts "Seriam Necessários #{months} meses"
    else
        puts "Waliff pagou a conta em #{months} meses."
    end
end
