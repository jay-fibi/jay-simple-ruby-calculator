# Jay Simple Ruby Calculator
#
# A simple command-line calculator that supports addition (+),
# subtraction (-), multiplication (*), and division (/).

class SimpleCalculator
  def run
    puts "=== Jay Simple Ruby Calculator ==="
    puts "Operations: +  -  *  /"
    puts "Type 'exit' to quit\n"

    loop do
      print "Enter first number: "
      num1 = gets&.chomp
      break if num1&.downcase == "exit"
      next unless valid_number?(num1)

      print "Enter operator (+, -, *, /): "
      operator = gets&.chomp
      break if operator&.downcase == "exit"

      print "Enter second number: "
      num2 = gets&.chomp
      break if num2&.downcase == "exit"
      next unless valid_number?(num2)

      result = perform(num1.to_f, operator, num2.to_f)
      puts "Result: #{num1} #{operator} #{num2} = #{result}" unless result.nil?
      puts
    end

    puts "Goodbye!"
  end

  private

  def perform(num1, operator, num2)
    case operator
    when "+" then num1 + num2
    when "-" then num1 - num2
    when "*" then num1 * num2
    when "/"
      if num2 == 0
        puts "Error: Division by zero is not allowed."
        nil
      else
        num1 / num2
      end
    else
      puts "Invalid operator. Use +, -, *, or /"
      nil
    end
  end

  def valid_number?(value)
    Float(value)
    true
  rescue ArgumentError, TypeError
    puts "Invalid input. Please enter a valid number."
    false
  end
end

SimpleCalculator.new.run if __FILE__ == $0
