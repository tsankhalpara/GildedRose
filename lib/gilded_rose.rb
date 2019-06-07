require_relative 'item'

class GildedRose

  attr_reader :items

  def initialize()
    @items = []
    @items << Item.new("Elixir of Youth", 5, 20)
    @items << Item.new("Aged Brie", 2, 0)
    @items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << Item.new("Conjured Cake", 3, 10)
  end

  def update_quality()
    for i in 0..(@items.size-1)
      if @items[i].name != "Aged Brie" and @items[i].name != "Backstage passes to a TAFKAL80ETC concert"
        if @items[i].quality > 0
          if @items[i].name != "Sulfuras, Hand of Ragnaros" and @items[i].name != "Conjured Cake"
            @items[i].quality = @items[i].quality - 1
          end
          if @items[i].name == "Conjured Cake"
            @items[i].quality = @items[i].quality - 2
            if @items[i].sell_in < 1
              @items[i].quality = @items[i].quality - 2
            end
          end
        end
      else
        if @items[i].quality < 50
          @items[i].quality = @items[i].quality + 1
          if @items[i].name == "Backstage passes to a TAFKAL80ETC concert"
            if @items[i].sell_in < 11
              if @items[i].quality < 50
                @items[i].quality = @items[i].quality + 1
              end
            end
            if @items[i].sell_in < 6
              if @items[i].quality < 50
                @items[i].quality = @items[i].quality + 1
              end
            end
          end
        end
      end
      if @items[i].name != "Sulfuras, Hand of Ragnaros"
        @items[i].sell_in = @items[i].sell_in - 1
      end
      if @items[i].sell_in < 0
        if @items[i].name != "Aged Brie"
          if @items[i].name != "Backstage passes to a TAFKAL80ETC concert"
            if @items[i].quality > 0
              if @items[i].name != "Sulfuras, Hand of Ragnaros"
                @items[i].quality = @items[i].quality - 1
              end
            end
          else
            @items[i].quality = @items[i].quality - @items[i].quality
          end
        else
          if @items[i].quality < 50
            @items[i].quality = @items[i].quality + 1
          end
        end
      end
    end
  end
end
