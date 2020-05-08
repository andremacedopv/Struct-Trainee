# Desafio 1 - Lista 0

# Create 'menu' hash
menu = {
    "entrada" => ["Bruschetta", "Salada", "Sopa"],
    "principal" => ["Bobó De Camarão", "Filet Mingon", "Bacalhau"],
    "sobremesa" => ["Torta de Limão", "Sorvete", "Petit Gateau"]
}

# Generate random 'meal' array
meal = []
menu.each do |key, value|
    meal.push(value.sample)
end

# Print generated 'meal' array
print meal.to_s + "\n"