all items have a SellIn value(denotes number of days to sell the item)
all items have a quality value(which denotes how valueble the item is
at the end of the day the system lowers the value for each item)

-Once the sell by date has passed, Quality degrades twice as fast 
-The Quality of an item is never negative
-“Aged Brie” actually increases in Quality the older it gets
-The Quality of an item is never more than 50
-“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
-“Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

“Conjured” items degrade in Quality twice as fast as normal items
Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly.

- make changes to UpdateQuality method

do not alter
-Item class 
-Items property 

You can make the UpdateQuality method + Items property static

Refactor the code in such a way that adding the new "conjured" functionality is easy

