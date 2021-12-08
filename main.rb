require "./items.rb"
require "./Container.rb"
# packing_style, length, width, height, weight, cog_height,cog_height_type
container  = Container.new("FR40")
item1= Item.new("CASE",300,200,234,1,100,"MANUAL")
item2 = Item.new("CASE",200,200,100,1,100,"MANUAL")
container.add(item1)
container.add(item2)
container.result
