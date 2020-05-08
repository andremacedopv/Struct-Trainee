# Exericio 16 - Lista 0

# Fucntion to get single DNA strand
# Return array with ten random elements
def getSingleStrand
    nucleotides = ["A", "T", "C", "G"]
    single = Array.new
    10.times { single.push(nucleotides.sample) }
    return single
end

# Function to get second strand of DNA
# Link A-T and C-G based on existing strand
def getSecondStrand (singleStrand)
    secondStrand = Array.new
    singleStrand.each do |item|
        if item == "A"
            secondStrand.push("T")
        elsif item == "T"
            secondStrand.push("A")
        elsif item == "C"
            secondStrand.push("G")
        elsif item == "G"
            secondStrand.push("C")
        end
    end
    return secondStrand
end

# Main code execution

# Get the two DNA strands
single = getSingleStrand
second = getSecondStrand (single)

# Print first strand
puts "Primeira fita:"
print single.to_s + "\n"

# Print DNA
dna = single.zip second # zips the two strands together
puts "DNA:"
dna.each do |first, second|
    puts "[#{first}, #{second}]"
end