module StringCalculator

  def self.add(string)
    string.scan(/\d+/).map(&:to_i).inject(0, :+)
  end
end
