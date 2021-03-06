local turtle = require "turtle"
local utils = require "utils"

local deep = 80
local realDeep = 0

function createStairs(deep)
  for i=1,deep do
    if utils.isBedrockBelow() then
      return 
    end
    realDeep = realDeep + 1
    utils.checkCollectIfLavaInFront()
    turtle.digDown()
    turtle.down()
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.back()
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.back()
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    -- here
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.back()
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.back()
    turtle.turnLeft()
    if i % 7 == 0 then
      local x = utils.selectTorch()
      if x ~= 0 then
        turtle.up()
        turtle.back()
        turtle.place()
        turtle.down()
        turtle.forward()
      end
    end
    if i % 5 == 0 then
      utils.refuelSmart()
      ignoreClean = {"chest", "torch", "bucket", "coal", "lapis", "redstone", "diamond"}
      utils.cleanUp(ignoreClean)
      ignoreChest = {"chest", "torch", "bucket"}
      if utils.hasFullSlotsIgnore(ignoreChest) then
        utils.createChestAndDrop()
      end
    end
  end
end

-- program
turtle.refuel()
createStairs(deep)

for i=1,realDeep + 1 do
  turtle.up()
  turtle.back()
end










