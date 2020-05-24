local turtle = require "turtle"
local utils = require "utils"

local deep = 80
local realDeep = 0

function levelDig(deep)
  for i=1,deep do
    realDeep = realDeep + 1
    utils.checkCollectIfLavaInFront()
    
    turtle.dig()
    turtle.forward()
    
    turtle.turnLeft()
    turtle.dig()
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.turnLeft()
    
    turtle.digUp()
    turtle.up()
           
    turtle.turnLeft()
    turtle.dig()
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.turnLeft()
    
    turtle.digUp()
    turtle.up()
        
    turtle.turnLeft()
    turtle.dig()
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.turnLeft() 
    
    turtle.down()
    turtle.down()
        
    if i % 7 == 0 then
      local x = utils.selectTorch()
      if x ~= 0 then
        turtle.back()
        turtle.turnLeft()
        turtle.place()
        turtle.turnRight()
        turtle.forward()
      end
    end
    if i % 5 == 0 then
      utils.refuelSmart()
      ignoreClean = {"chest", "torch", "bucket", "coal", "lapis", "redstone", "diamond"}
      utils.cleanUp(ignoreClean)
    end
  end
end

-- program
turtle.refuel()
levelDig(deep)

for i=1,realDeep + 1 do
  turtle.back()
end










