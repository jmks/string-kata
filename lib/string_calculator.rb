module StringCalculator

  def self.add(string)
    numbers   = get_numbers(string)
    negatives = numbers.select { |i| i < 0 }

    if negatives.any? 
      raise "Negative numbers not allowed: #{negatives}"
    else
      numbers.inject(0, :+)
    end
  end

  def self.get_numbers(string)
    string.scan(/-?\d+/).map(&:to_i).select { |i| i <= 1000 }
  end
end
