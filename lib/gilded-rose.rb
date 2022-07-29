class GildedRose
    # initialise items property 
    def initialize(items)
      @items = items
    end
    # updates quality of items 
    def update_quality()
      @items.each do |item|
          if item.name == "Aged Brie"
            specialA(item)
          elsif item.name == "Sulfuras, Hand of Ragnaros"
            specialS(item)
          elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
            specialB(item)
          elsif item.name == "Conjured"
            specialC(item)
          elsif item.sell_in <= 0
            item.quality = item.quality - 2
          elsif item.sell_in > 0 && item.quality > 0 && item.quality < 50
              item.quality = item.quality - 1
              item.sell_in = item.sell_in - 1
          else 
              return item.quality
          end 
      end  
    end 
    
    # updates quality of Aged Brie
    def specialA(item)
      if item.quality < 50 && item.quality > 0
        item.quality = item.quality + 1
        item.sell_in - 1
      end
    end 
   # updates quality of Sulfuras, Hand of Ragnaros
    def specialS(item)
      if item.quality < 50 && item.quality > 0
        item.quality
      end
    end 
    
    # updates quality of Backstage passes to a TAFKAL80ETC concert
    def specialB(item)
      if item.quality < 50 && item.quality > 0  
        if item.sell_in <= 10 && item.sell_in >= 6
          item.quality = item.quality + 2
        elsif item.sell_in <= 5 && item.sell_in >= 1
          item.quality = item.quality + 3
        elsif item.sell_in == 0
          item.quality = item.quality - item.quality
        end
      end
    end 
    
    # updates quality of Conjured
    def specialC(item)
      if item.quality < 50 && item.quality >= 2   
        item.quality = item.quality - 2
      end
    end
end 

# items class to generate a new item
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end