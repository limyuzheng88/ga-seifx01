def countdown(n = 10)
  sleep 1
  if n < 1
    puts "blast off!"
  else
    puts n
    countdown n - 1
  end
end

# Here's an implementation of gcd using Euclid’s algorithm.
def gcd(a, b)
  if b == 0
    a
  else
    gcd(b, a % b)
  end
end

def sum_digits(str, index = 0)
  if index == str.size
    0
  else
    str[index].to_i + sum_digits(str, index + 1)
  end
end

def memoized(n, func, cache)
  if cache.has_key?(n)
    cache[n]
  else
    val = func.call(n, cache)
    cache[n] = val
    val
  end
end

def fibonacci_r(n)
  if n <= 2
    1 # Base case
  else
    fibonacci_r(n - 1) + fibonacci_r(n - 2)
  end
end

def fibonacci_m(n, cache = Hash.new)
  if n <= 2
    1 # Base case
  else
    memoized(n - 1, method(:fibonacci_m), cache) + memoized(n - 2, method(:fibonacci_m), cache)
  end
end

def factorial_tailrec(acc = 1, n)
  if n == 0
    acc
  else
    factorial_tailrec(n * acc, n - 1)
  end
end

def factorial(n)
  if n == 0
    1
  else
    n * factorial(n - 1)
  end
end

def largest(array, max_index = -1, current_index = 0, max_number = nil)
  if array.empty?
    max_index
  else
    first, *rest = array
    if !max_number || first > max_number
      max_number = first
      max_index = current_index
    end
    largest(rest, max_index, current_index + 1, max_number)
  end
end

def pascal(col, row)
  if col == 0 || row == col
    1
  else
    pascal(col - 1, row - 1) + pascal(col, row - 1)
  end
end

def draw_pascal(rows)
  for row in 0..rows do
    for col in 0..row do
      print pascal(col, row).to_s + " "
    end
    puts ""
  end
end

def binary_search(array, element)
  index = array.size / 2
  found = false
  until found
    current = array[index]
    if element == current
      found = true
    elsif element < current
      index -= index / 2
    else
      index += (array.size - index) / 2
    end
  end
  index
end

puts binary_search([9, 12, 34, 67, 343], 12)
puts binary_search([9, 12, 34, 67, 343, 980, 1023, 11110, 11111], 1023)