require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end

    it "quality is not below 0" do
      items = [Item.new("foo", 0, -2)]
      GildedRose.new(items).update_quality()
      expect{items[0].quality}.to raise_error
    end

end
