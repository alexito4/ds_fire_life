STRINGS = GLOBAL.STRINGS
RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
Ingredient = GLOBAL.Ingredient
TECH = GLOBAL.TECH
ACTIONS = GLOBAL.ACTIONS

-- Options
local optionKeep = (GetModConfigData("keep") == "yes")
local optionDisplay = GetModConfigData("display")
local optionDisplayAbsolute = optionDisplay == "absolute" or optionDisplay == "both"
local optionDisplayPercentage = optionDisplay == "percentage" or optionDisplay == "both"

-- Helper functions
function getFueled(inst)
  if inst and inst.components and inst.components.fueled then
    return inst.components.fueled
  end
  return nil
end

function absoulteFuelString(fueled)
  return math.floor(fueled.currentfuel) .. "/" .. fueled.maxfuel
end

function percentageFuelString(fueled)
  local percentage = math.floor((fueled.currentfuel / fueled.maxfuel) * 100)
  return  string.format("%.f", percentage)
end

-- Hook
AddComponentPostInit("inspectable", function(inst)
  local originalDesc = inst.GetDescription
  function inst:GetDescription(viewer)
    local desc = originalDesc(self,viewer)
    local fueled = getFueled(self.inst)
    if fueled then
      local fuelDesc = "Fuel: "
      if optionDisplayAbsolute then
        fuelDesc = fuelDesc .. absoulteFuelString(fueled)
      end
      if optionDisplayPercentage then
        if optionDisplayAbsolute then
          fuelDesc = fuelDesc .. " "
        end
        fuelDesc = fuelDesc .. percentageFuelString(fueled)
      end
      if optionKeep then
        desc = desc .. " " .. fuelDesc
      else
        desc = fuelDesc
      end
    end
    return desc
  end
end)
