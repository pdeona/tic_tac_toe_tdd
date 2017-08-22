require "spec_helper"
 
RSpec.describe Array do
  context "#all_empty?" do
    it "returns true if all elements of the Array are empty" do
      expect(["", "", ""].all_empty?).to be true
    end
 
    it "returns false if some of the Array elements are not empty" do
      expect(["", 1, "", Object.new, :a].all_empty?).to be false
    end
 
    it "returns true for an empty Array" do
      expect([].all_empty?).to be true
    end
  end

  context "#all_same?" do
    it "returns true if the Array is empty" do
      a = Array.new(3)
      expect(a.all_same?).to be true
    end

    it "returns false if all elements of the Array aren't the same" do
      a = Array.new(2)
      a << "hi"
      expect(a.all_same?).to be false
    end

    it "returns true if all elements of the Array are the same" do
      a = Array.new(3, "a")
      expect(a.all_same?).to be true
    end
  end

  context "#any_empty?" do
    it "returns true on empty Array" do
      test_array = Array.new(3)
      expect(test_array.any_empty?).to be true
    end

    it "returns false on Array with no empty indices" do
      full_array = Array.new(3, "hi")
      expect(full_array.any_empty?).to be false
    end

    it "returns true on Array with 1 empty index" do
      almost_full = [1, 1, ""]
      expect(almost_full.any_empty?).to be true
    end
  end

  context "#none_empty?" do
    it "returns false on empty Array" do
      test_array = Array.new(3)
      expect(test_array.none_empty?).to be false
    end

    it "returns true on Array with no empty elements" do
      test_array_full = Array.new(3, "fullboys")
      expect(test_array_full.none_empty?).to be true
    end
  end
end