-- Reloading the Hammerspoon conf. should be a breeze
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "r", function()
  hs.reload()
end)

-- Caffeine-esque functionality (without the need for a dedicated app)
local caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
  if state then
    caffeine:setTitle("◉")
    caffeine:setTooltip("Computer currently prevented from going to sleep")
  else
    caffeine:setTitle("◎")
    caffeine:setTooltip("Computer currently allowed to go to sleep")
  end
end

function caffeineClicked()
  setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
  caffeine:setClickCallback(caffeineClicked)
  setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

-- Switching windows through hints
hs.hints.titleMaxSize = 30
hs.hints.showTitleThresh = 30
hs.hotkey.bind({"cmd", "shift"}, "\\", function()
  hs.hints.windowHints()
end)
