local turtle = require "turtle"
local utils = require "utils"

function createStairs(deep)
  for i=1,deep do
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
    if i % 4 == 0 then
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
      ignore = {"chest", "torch"}
      if utils.hasFullSlotsIgnore(ignore) then
        utils.createChestAndDrop()
      end
    end
  end
end

-- program
local deep = 80
turtle.refuel()
createStairs(deep)

for i=1,deep + 1 do
  turtle.up()
  turtle.back()
end










