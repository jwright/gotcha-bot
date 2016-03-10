RSpec.describe GotchaBot::String do
  it "returns an empty string for nil strings" do
    expect(described_class.new(nil)).to be_empty
  end

  describe "#to_s" do
    it "returns a string representation" do
      expect(described_class.new(123).to_s).to eq "123"
    end
  end

  describe "#==" do
    it "returns true for other strings" do
      expect(described_class.new("blah") == "blah").to eq true
    end

    it "returns true for values that respond to to_s" do
      expect(described_class.new(123) == "123").to eq true
    end

    it "returns true using eql method" do
      expect(described_class.new("blah")).to eq "blah"
    end
  end

  describe "#method_missing" do
    it "returns the same thing a string would" do
      expect(described_class.new("123").chars).to eq ["1", "2", "3"]
    end

    it "wraps the result in this string class for chaining" do
      expect(described_class.new("blah").capitalize).to be_a_kind_of described_class
    end

    it "raises a NoMethodError if the method is not defined on string" do
      expect { described_class.new("123").blah }.to raise_error NoMethodError
    end
  end

  describe "#respond_to_missing?" do
    it "responds to the string interface" do
      expect(described_class.new("123").respond_to?(:chars)).to eq true
    end
  end

  describe "#demodulize" do
    it "removes the module names from the class" do
      expect(described_class.new("Testing::Test").demodulize.to_s).to eq "Test"
    end

    it "returns an empty string for nil strings" do
      expect(described_class.new(nil).demodulize).to be_empty
    end

    it "returns the class name if that is all there is" do
      expect(described_class.new("Test").demodulize.to_s).to eq "Test"
    end
  end

  describe "#underscore" do
    it "downcases the string" do
      expect(described_class.new("Test_ME").underscore.to_s).to eq "test_me"
    end

    it "returns an empty string for nil strings" do
      expect(described_class.new(nil).underscore.to_s).to be_empty
    end

    it "underscores PascalCased strings" do
      expect(described_class.new("TestMe").underscore.to_s).to eq "test_me"
    end

    it "underscores camelCased strings" do
      expect(described_class.new("testMe").underscore.to_s).to eq "test_me"
    end

    it "underscores dashed strings" do
      expect(described_class.new("test-me").underscore.to_s).to eq "test_me"
    end

    it "changes namespace seperators to back slashes" do
      expect(described_class.new("Testing::TestMe").underscore.to_s).to eq "testing/test_me"
    end
  end
end
