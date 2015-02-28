module StringCalculator

  def self.add(string)
    string.split(',').map(&:to_i).inject(0, :+)
  end
end
