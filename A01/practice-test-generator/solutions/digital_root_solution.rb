# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 9 (i.e. more than one digit), sum the digits of
# the resulting number. Keep repeating until there is only one digit in the 
# result, called the "digital root". **Do NOT use the built in `Integer#to_s`
# or `Integer#digits` methods in your implementation.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  while num >= 10
    num = digital_root_step(num)
  end

  num
end

def digital_root_step(num)
  root = 0
  while num > 0
    root += (num % 10)

    num /= 10
  end

  root
end

# Alternate Solution
def digital_root(num)
  digits = []

  while num > 0
    digits << num % 10
    num /= 10
  end

  digit_sum = digits.inject(&:+)

  digit_sum >= 10 ? digital_root(digit_sum) : digit_sum
end

# Magical one-line solution
def digital_root(num)
  num < 10 ? num : digital_root(digital_root(num / 10) + (num % 10))
end
