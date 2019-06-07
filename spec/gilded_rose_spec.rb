require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      subject.update_quality()
      expect(subject.items[0].name).to eq "Elixir of Youth"
    end

    describe "Elixir of Youth" do
      context 'sell-in > 0 && quality > 0' do
        it "reduces the sell-in by 1" do
          subject.update_quality
          expect(subject.items[0].sell_in).to eq 4
        end
        it "reduces the quality by 1" do
          subject.update_quality
          expect(subject.items[0].quality).to eq 19
        end
      end

      context 'sell-in == 0 && quality > 0' do
        before do
         5.times { subject.update_quality }
        end
        it "reduces the sell-in by 1" do
          subject.update_quality
          expect(subject.items[0].sell_in).to eq -1
        end
        it "reduces the quality by 2" do
          subject.update_quality
          expect(subject.items[0].quality).to eq 13
        end
      end

      context 'sell-in < 0 && quality == 0' do
        before do
         12.times { subject.update_quality }
        end
        it "reduces the sell-in by 1" do
          subject.update_quality
          expect(subject.items[0].sell_in).to eq -8
        end
        it "quality does not fall below 0" do
          subject.update_quality
          expect(subject.items[0].quality).to eq 0
        end
      end
    end

    describe "Aged Brie" do
      context 'sell-in > 0 && quality == 0' do
        it "reduces the sell-in by 1" do
          subject.update_quality
          expect(subject.items[1].sell_in).to eq 1
        end
        it "increases the quality by 1" do
          subject.update_quality
          expect(subject.items[1].quality).to eq 1
        end
      end

      context 'sell-in == 0 && quality > 0' do
        before do
         2.times { subject.update_quality }
        end
        it "reduces the sell-in by 1" do
          subject.update_quality
          expect(subject.items[1].sell_in).to eq -1
        end
        it "increases the quality by 2" do
          subject.update_quality
          expect(subject.items[1].quality).to eq 4
        end
      end

      context 'sell-in < 0 && quality == 50' do
        before do
         26.times { subject.update_quality }
        end
        it "reduces the sell-in by 1" do
          subject.update_quality
          expect(subject.items[1].sell_in).to eq -25
        end
        it "quality does not go above 50" do
          subject.update_quality
          expect(subject.items[1].quality).to eq 50
        end
      end
    end

    describe "Sulfuras, Hand of Ragnaros" do
      context 'sell-in == 0 && quality == 80' do
        it "sell-in stays the same" do
          subject.update_quality
          expect(subject.items[2].sell_in).to eq 0
        end
        it "quality stays the same" do
          subject.update_quality
          expect(subject.items[2].quality).to eq 80
        end
      end
    end

    describe "Backstage passes to a TAFKAL80ETC concert" do
      context 'sell-in > 10 && quality > 0' do
        it "reduces sell-in by 1" do
          subject.update_quality
          expect(subject.items[3].sell_in).to eq 14
        end
        it "increases quality by 1" do
          subject.update_quality
          expect(subject.items[3].quality).to eq 21
        end
      end

      context '5 < sell-in <= 10 && quality > 0' do
        before do
         5.times { subject.update_quality }
        end
        it "reduces sell-in by 1" do
          subject.update_quality
          expect(subject.items[3].sell_in).to eq 9
        end
        it "increases quality by 2" do
          subject.update_quality
          expect(subject.items[3].quality).to eq 27
        end
      end

      context '0 < sell-in < 5 && quality > 0' do
        before do
         10.times { subject.update_quality }
        end
        it "reduces sell-in by 1" do
          subject.update_quality
          expect(subject.items[3].sell_in).to eq 4
        end
        it "increases quality by 3" do
          subject.update_quality
          expect(subject.items[3].quality).to eq 38
        end
      end

      context 'sell-in < 0 && quality == 0' do
        before do
         15.times { subject.update_quality }
        end
        it "reduces sell-in by 1" do
          subject.update_quality
          expect(subject.items[3].sell_in).to eq -1
        end
        it "increases quality by 3" do
          subject.update_quality
          expect(subject.items[3].quality).to eq 0
        end
      end
    end

    describe "Conjured Cake" do
      context 'sell-in > 0 && quality > 0' do
        it "reduces sell-in by 1" do
          subject.update_quality
          expect(subject.items[4].sell_in).to eq 2
        end
        it "reduces quality by 2" do
          subject.update_quality
          expect(subject.items[4].quality).to eq 8
        end
      end

      context 'sell-in < 0 && quality > 0' do
        before do
         3.times { subject.update_quality }
        end
        it "reduces sell-in by 1" do
          subject.update_quality
          expect(subject.items[4].sell_in).to eq -1
        end
        it "reduces quality by 4" do
          subject.update_quality
          expect(subject.items[4].quality).to eq 0
        end
      end
    end


  end



end
