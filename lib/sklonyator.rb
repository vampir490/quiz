# The module returns correct form of the word
# It is developed initially to work with Russian language with three different forms for one, two and multiple items
module Sklonyator
  def self.sklonenie(number, one, two, multy)
    # Getting remainder divided by 10
    # And remainder divided by 100. It is needed for 112, 113 ...
    tail10 = number % 10
    tail100 = number % 100

    # If remainder divided by 10 - 1, returns the first option
    return one if (tail10 == 1 && tail100 != 11)

    # Returns the second option, if remainder divided by 10 is between 2 and 5
    # Not forgetting about 3-digits numbers in if after &&
    if (tail10 >= 2 && tail10 <= 4) && !tail100.between?(12, 14)
      return two
    end

    return multy
  end
end
