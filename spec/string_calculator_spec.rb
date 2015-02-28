#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'string_calculator'

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe StringCalculator, "#add" do

  # 1

  it "returns 0 for empty string" do
    expect(StringCalculator.add("")).to eql(0)
  end

  # 2
  
  it "returns 0 for '0'" do 
    expect(StringCalculator.add("0")).to eql 0
  end

  it "returns 5 for '5'" do 
    expect(StringCalculator.add("5")).to eql 5
  end

  # 3
  
  it "returns 3 for '1,2'" do 
    expect(StringCalculator.add("1,2")).to eql 3
  end

  it "returns 16 for '7,9'" do 
    expect(StringCalculator.add("7,9")).to eql 16
  end

  # 4

  context "when two digits separated by a comma it should sum then" do 
    it "returns 57 for '12,45'" do 
      expect(StringCalculator.add('12,45')).to eql 57
    end

    it "returns 201 for '42,159'" do 
      expect(StringCalculator.add('42,159')).to eql 201
    end
  end

  # 5

  context "when any number of comma-separated numbers as a string then" do 
    it "returns 4002 for '1558,2,2442'" do 
      expect(StringCalculator.add('1558,2,2442')).to eql 4002
    end

    it "returns 161 for '15,22,45,79'" do 
      expect(StringCalculator.add('15,22,45,79')).to eql 161
    end

    it "returns 2 for '2'" do 
      expect(StringCalculator.add('2')).to eql 2
    end
  end

  # 6

  context "when delimiting by either a comma or newline" do 
    it "returns 6 for '1\n2,3'" do 
      expect(StringCalculator.add("1\n2,3")).to eql 6
    end

    # Why might your solution produce the value 4?
    # to_i with a valid base always returns a valid integer
    # in this case, it truncates at the first non-digit character
    # so "1\n2".to_i returns 1
  end

  # 7

  context "allow delimiter in input" do 
    it "returns 7 for '//;\n2;5'" do 
      expect(StringCalculator.add("//;\n2;5")).to eql 7
    end
  end

  # 8

  context "throw exception when there's a negative number" do 
    it "raises exception for 1,-1" do 
      expect do 
        StringCalculator.add("1,-1")
      end.to raise_error
    end

    it "raises exception for //;2\n3;-1" do 
      expect do 
        StringCalculator.add("//;2\n3;-1")
      end.to raise_error
    end
  end

  # 9

  context "when negative numbers are present" do 
    it "should list -1 and -5 in the exception message for '1,-1,3,-5'" do 
      expect do
        StringCalculator.add("1,-1,3,-5")
      end.to raise_error /-1, -5/
    end
  end

  # 10

  context "when numbers are larger than 1000, ignore them" do 
    it "returns 0 for '1337,7331'" do 
      expect(StringCalculator.add("1337,7331")).to eql 0
    end

    it "returns 1 for '1001,1'" do 
      expect(StringCalculator.add("1001,1")).to eql 1
    end

    it "returns 1 for '1001,1,1867'" do 
      expect(StringCalculator.add("1001,1,1867")).to eql 1
    end
  end
end
