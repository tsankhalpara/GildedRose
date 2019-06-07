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
      item = @items[i]
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros" and item.name != "Conjured Cake"
            decrease_quality(item,1)
          end
          if item.name == "Conjured Cake"
            decrease_quality(item,2)
            if item.sell_in < 1
              decrease_quality(item,2)
            end
          end
        end
      else
        if under_max_quality(item)
          increase_quality(item,1)
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if under_max_quality(item)
                increase_quality(item,1)
              end
            end
            if item.sell_in < 6
              if under_max_quality(item)
                increase_quality(item,1)
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                decrease_quality(item,1)
              end
            end
          else
            decrease_quality(item,item.quality)
          end
        else
          if under_max_quality(item)
            increase_quality(item,1)
          end
        end
      end
    end
  end

  def increase_quality(item, amount)
    item.quality += amount
  end

  def decrease_quality(item, amount)
    item.quality -= amount
  end

  def under_max_quality(item)
    item.quality < 50
  end

end
