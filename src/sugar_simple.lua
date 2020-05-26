local turtle = require "turtle"
local utils = require "utils"


local deep = 8
local width = 3

function harvestSugar()
  if utils.isSugarCane() then
    turtle.up()
    if utils.isSugarCane() then
      -- sugar cane is two high
      turtle.down()
      turtle.dig()
      turtle.suck()
      turtle.turnLeft()
      turtle.suck()
      turtle.turnRight()
      turtle.turnRight()
      turtle.suck()
      turtle.turnLeft()
      if utils.selectItem("sugar_cane") ~= 0 then
        turtle.place()
      end        
    else
      -- sugar cane is one high
      turtle.down()
    end
   else
     -- sugar cane is zero high
     if utils.selectItem("sugar_cane") ~= 0 then
        turtle.place()
      end
   end
end

function sugarSimple(deep)
while true do
  for i=1,deep do
    turtle.forward()
    turtle.turnLeft()
    if i == 1 then
      turtle.suck()
      utils.refuelFromAnySlot()
    end
    if i == 7 then
      ignore = {"coal", "lava"}
      utils.dropItemsToChestIgnore(ignore) 
    end
    if i > 1 and i < 7 then
      turtle.suck()    
    end
     harvestSugar()
     turtle.turnRight()
  end
  turtle.turnLeft()
  turtle.forward()
  turtle.forward()
  turtle.turnLeft()
  turtle.suck()
  harvestSugar()
  turtle.turnRight()
  turtle.forward()
  turtle.forward()
  turtle.turnLeft()
  sleep(120)
end
end

-- program
turtle.refuel()
sugarSimple(deep, width)














