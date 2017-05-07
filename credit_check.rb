# JF's Credit Check project (works on Amex numbers too)

card_number = "4929735477250543"
valid = false
#Use Luhn Algorithm to determine if card is valid
  second_row = []
  card_number.reverse!  #Start at the end of card numbers
             .chars
             .each_index { |index|
    if index % 2 == 1
      second_row << card_number[index].to_i * 2
    else
      second_row << card_number[index].to_i
    end
  }
  second_row.reverse! #Place array back to right order
            .map! { |numbers| #Add digits together if > 9
    if numbers > 9
        a = numbers.to_s.split("")[0]
        b = numbers.to_s.split("")[1]
        numbers = a.to_i + b.to_i
    else
      numbers
    end
  }
# Add final array and check if divisible by 10
    if second_row.inject {|sum, number| sum + number} % 10 == 0
      valid = true
    else
      valid = false
    end

  # If it is valid, print "The number is valid!"
  # If it is invalid, print "The number is invalid!"
  if valid == true
    puts "The number is valid!"
  else
    puts "The number is invalid!"
  end
