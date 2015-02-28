module StringCalculator

  def self.add(string)
    numbers = get_numbers(string)

    if numbers.any? { |i| i < 0 }
      raise "Negative number error"
    else
      numbers.inject(0, :+)
    end
  end

  def self.get_numbers(string)
    string.scan(/-?\d+/).map(&:to_i)
  end
end
