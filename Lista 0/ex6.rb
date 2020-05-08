# Exericio 6 - Lista 0

# Print even numbers
first = 1
last = 100
for i in first..last
    if (i % 2) == 0
        # Print in "x, y, ..., z" pattern
        if i == last
            puts "#{i}"
        else
            print "#{i}, "
        end
    end
end