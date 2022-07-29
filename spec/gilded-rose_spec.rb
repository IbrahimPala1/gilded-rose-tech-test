require './lib/gilded-rose'

RSpec.describe "gilded rose" do
    it "checks that items have a sell_in value" do
        items = Item.new("Aged Brie", 10, 10)
        expect(items.sell_in).to eq 10
    end 
    it "checks that all items has a quality value " do
        items = Item.new("Aged Brie", 10, 10)
        expect(items.quality).to eq 10
    end 
    it "checks that all items has a name value " do
        items = Item.new("Aged Brie", 10, 10)
        expect(items.name).to eq "Aged Brie"
    end 
    it "checks that items quality value decreases at the end of day" do
        items = [Item.new("Example item", 10, 10)]
        expect{GildedRose.new(items).update_quality()}.to change {items[0].quality}.from(10).to(9)
    end 
    it "checks that items sell_in value decreases at the end of day" do
        items = [Item.new("Example item", 10, 10)]
        expect{GildedRose.new(items).update_quality()}.to change {items[0].sell_in}.from(10).to(9)
    end 
    it "checks that items quality degrades twice as fast after sell_by date has passed" do
        items = [Item.new("Example item", 0, 10)]
        expect{GildedRose.new(items).update_quality()}.to change {items[0].quality}.from(10).to(8)
    end 
    it "checks Aged Brie quality changes" do
        item = [Item.new("Aged Brie", 10, 30)]
        expect{ GildedRose.new(item).update_quality() }.to change{ item[0].quality }
    end 
    it "checks Aged Brie increases in quality the older it gets " do
        item = [Item.new("Aged Brie", 10, 30)]
        expect{ GildedRose.new(item).update_quality() }.to change{ item[0].quality }.from(30).to(31)
    end 
    it "checks Sulfuras quality does not change" do
        item = [Item.new("Sulfuras, Hand of Ragnaros", 10, 30)]
        expect{ GildedRose.new(item).update_quality()}.to_not change{ item[0].quality}
    end
    it 'checks Backstage passes changes in quality' do
        item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
        expect { GildedRose.new(item).update_quality}.to change {item[0].quality}
    end 
    it 'checks Backstage passes changes in quality' do
        item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
        expect { GildedRose.new(item).update_quality}.to change {item[0].quality}
    end 
    it 'checks Backstage passes increases in quality by 2 when there are 10 days or less ' do
        item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
        expect { GildedRose.new(item).update_quality}.to change {item[0].quality}.from(10).to(12)
    end 
    it 'checks Backstage passes increases in quality by 3 when there are 5 days or less ' do
        item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
        expect { GildedRose.new(item).update_quality}.to change {item[0].quality}.from(10).to(13)
    end 
    it 'checks Backstage passes quality becomes 0 when when sell_in date passes' do
        item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
        expect { GildedRose.new(item).update_quality}.to change {item[0].quality}.from(10).to(0)
    end 
    it 'checks that the quality of an item is never more than 50' do
        item = [Item.new("Aged Brie", 10, 48)]
        gilded = GildedRose.new(item)
        14.times do
          gilded.update_quality()
        end
        expect(item[0].quality).to eq(50)
    end
    it 'checks that the quality of an item is never negative when given a random item' do
        item = [Item.new("Example item", 10, 5)]
        gilded = GildedRose.new(item)
        14.times do
          gilded.update_quality()
        end
        expect(item[0].quality).to eq(0)
    end
    it 'checks that the quality of an item is never negative when item is Aged Briee' do
        item = [Item.new("Aged Briw", 10, 5)]
        gilded = GildedRose.new(item)
        14.times do
          gilded.update_quality()
        end
        expect(item[0].quality).to eq(0)
    end
    it 'checks that the quality of an item is never negative when item is Backstage passes' do
        item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 5)]
        gilded = GildedRose.new(item)
        14.times do
          gilded.update_quality()
        end
        expect(item[0].quality).to eq(0)
    end
    it 'checks that the quality of an item is never negative when item is Conjured' do
        item = [Item.new("Conjured", 0, 6)]
        gilded = GildedRose.new(item)
        14.times do
          gilded.update_quality()
        end
        expect(item[0].quality).to eq(0)
    end
    it 'checks that quality degrades twice as fast once the sell_by date has passed' do 
        item = [Item.new("Example item", 0, 10)]
        GildedRose.new(item).update_quality
        expect(item[0].quality).to eq(8)
    end
    it 'checks that conjured items degrade twice as fast as normal items' do
        item = [Item.new("Conjured", 10, 10)]
        expect { GildedRose.new(item).update_quality}.to change{item[0].quality}.from(10).to(8)
    end
end