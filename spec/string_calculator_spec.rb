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
    # "1\n2".to_i returns 1
  end
end
