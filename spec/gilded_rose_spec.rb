require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      subject.update_quality()
      expect(subject.items[0].name).to eq "Elixir of Youth"
    end

    describe "Elixir of Youth" do
      it "reduces the sell-in by 1" do
        subject.update_quality
        expect(subject.items[0].sell_in).to eq 4
      end
    end



  end



end
