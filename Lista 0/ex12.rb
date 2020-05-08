# Exericio 12 - Lista 0

# Function to verify if year is leap year
def isLeapYear?(year)
    if (year % 4) == 0
        if (year % 100) != 0
            return true
        end
    elsif (year % 400) == 0
        return true
    else
        return false
    end
end

# Generate array
years = (1901..2000).to_a

# Get array with leap years
leaps = Array.new
years.each do |item|
    if isLeapYear?(item)
        leaps.push(item)
    end
end

# Print leap years
print leaps.to_s + "\n"