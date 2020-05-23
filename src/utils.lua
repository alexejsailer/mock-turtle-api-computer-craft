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


function utils.createChestAndDrop()
  turtle.up()
  turtle.back()
  utils.placeChest()
  ignore = {"chest", "torch"}
  utils.dropItemsToChestIgnore(ignore)
  turtle.down()
  turtle.forward()
end

function utils.placeChest()
  local x = utils.selectItem("chest")
  if x ~= 0 then
    turtle.place()
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


return utils
