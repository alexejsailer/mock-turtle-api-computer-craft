local turtle = require "turtle"
local utils = {}

function utils.selectItem(name)
  for i=1,16 do
    turtle.select(i)
    local data = turtle.getItemDetail()
    if data ~= nil then
      if string.find(data.name, name) then
        return i;
      end
    end
  end
  return 0
end

function utils.selectItemEqual(name)
  for i=1,16 do
    turtle.select(i)
    local data = turtle.getItemDetail()
    if data ~= nil then
      if data.name == name then
        return i;
      end
    end
  end
  return 0
end

function utils.selectTorch()
  for i=1,16 do
    turtle.select(i)
    local data = turtle.getItemDetail()
    if data ~= nil then
      if string.find(data.name, "torch") then
        return i;
      end
    end
  end
  return 0
end

function utils.checkCollectIfLavaInFront()
  local success, data = turtle.inspect()
  if success then
    if string.find(data.name, "lava") then
      local ret = utils.selectItemEqual("bucket")
      if ret ~= 0 then
        turtle.place()
      end
    end
  end
end


function utils.refuelSmart()
local needsFuel = turtle.getFuelLevel() + 3000 - turtle.getFuelLimit()
  if needsFuel < 0 then
    for i=1,16 do
      turtle.select(i)
      local data = turtle.getItemDetail()
      if data ~= nil then
        if string.find(data.name, "coal") then
          print("refuling")
          turtle.refuel()
        end
      end
    end
  end
end


function utils.cleanUp(ignore)
  for i=1,16 do
    turtle.select(i)
    local data = turtle.getItemDetail()
    if data ~= nil then
      if string.find(data.name, "ore") == nil then
        if utils.isSelectedToBeIgnored(ignore) == 0 then
          turtle.drop()
        end
      end
    end
  end
end

function utils.isBedrockBelow()
  local success, data = turtle.inspectDown()
  if success then
    if string.find(data.name, "bedrock") then
      return true
    end
  end
  return false
end

function utils.createChestAndDrop()
  turtle.up()
  turtle.digUp()
  turtle.dig()
  turtle.forward()
  turtle.digUp()
  turtle.back()
  utils.placeChest()
  ignore = {"chest", "torch", "bucket"}
  utils.dropItemsToChestIgnore(ignore)
  turtle.back()
  turtle.down()
  turtle.forward()
end

function utils.placeChest()
  local x = utils.selectItem("chest")
  if x ~= 0 then
    turtle.place()
    print("Chest placed")
  end
end

function utils.isSelectedToBeIgnored(ignore)
  local data = turtle.getItemDetail()
  for key,value in pairs(ignore) do
    if data ~= nil then
      if string.find(data.name, value) then
        return 1
      end
    end
  end
  return 0
end

-- t = {foo = "bar", [123] = 456}
-- t = {"chest", "torch"}
function utils.dropItemsToChestIgnore(ignore)
  for i=1,16 do
    turtle.select(i)
    if utils.isSelectedToBeIgnored(ignore) == 0 then
      turtle.drop()
    end
  end
end

function utils.hasFullSlots()
  for i=1,16 do
    if turtle.getItemCount(i) == 64 then
      return true
    end
  end
  return false;
end

function utils.hasFullSlotsIgnore(ignore)
  for i=1,16 do
    if turtle.getItemCount(i) == 64 then
      turtle.select(i)
      if utils.isSelectedToBeIgnored(ignore) == 0 then
        return true
      end
    end
  end
  return false;
end

function utils.refuelFromAnySlot()
local needsFuel = turtle.getFuelLevel() + 3000 - turtle.getFuelLimit()
  if needsFuel < 0 then
    for i=1,16 do
      turtle.select(i)
      turtle.refuel()
    end
  end
end

function utils.isSugarCane()
  local success, data = turtle.inspect()
  if success then
    if string.find(data.name, "sugar_cane") then
      return true
    end
  end
  return false
end


return utils
