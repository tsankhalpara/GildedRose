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



  end



end
