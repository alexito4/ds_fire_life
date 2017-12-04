-- This information tells other players more about the mod
name = "Fire life"
description = "Shows the current level of fuel in the firepit."
author = "alexito4"
version = "6" -- 6: Shipwrecked compatible

forumthread = ""

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 6

-- Compatibility
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true

-- Can specify a custom icon for this mod!
icon_atlas = "icon.xml"
icon = "icon.tex"

-- priority=-10 -- must load after new characters

configuration_options =
{
  {
    name = "display",
    label = "Display Mode",
    options =
    {
      {description = "Percentage", data = "percentage"},
      {description = "Absolute", data = "absolute"},
      {description = "Both", data = "both"}
    },
    default = "absolute",
  },
  {
    name = "keep",
    label = "Keep original text",
    options =
    {
      {description = "Yes", data = "yes"},
      {description = "Nope", data = "no"}
    },
    default = "yes"
  }
}
