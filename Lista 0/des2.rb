# Desafio 2 - Lista 0

# Create 'menu' hash
menu = {
    "entrada" => {
        "Bruschetta" => 2.5, "Salada" => 3, "Sopa" => 5
    },
    "principal" => {
        "Bobó De Camarão" => 30, "Filet Mingon" => 25, "Bacalhau" => 35
    },
    "sobremesa" => {
        "Torta de Limão" => 12.5, "Sorvete" => 9.5, "Petit Gateau" => 11
    }
}

# Generate random 'meal' array and final price
meal = []
price = 0
menu.each do |key, dishes|
    selected_dish = dishes.keys.sample
    meal.push(selected_dish)
    price += dishes[selected_dish]
end

# Print generated 'meal' array
print meal
printf(". Total: R$%.2f.\n", price) # use printf to print float with 2 precision points