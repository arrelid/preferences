-- Manipulation of window position and size
function resizeFrontmostApplication(layout)
  hs.application.frontmostApplication():focusedWindow():moveToUnit(layout, 0)
end

hs.hotkey.bind({"cmd", "alt"}, "j", function()
  resizeFrontmostApplication(hs.layout.left50)
end)

hs.hotkey.bind({"cmd", "alt"}, "k", function()
  resizeFrontmostApplication(hs.layout.maximized)
end)

hs.hotkey.bind({"cmd", "alt"}, "l", function()
  local focusedWindow = hs.application.frontmostApplication():focusedWindow()
  focusedWindow:moveToScreen(focusedWindow:screen():next(), 0)
end)

hs.hotkey.bind({"cmd", "alt"}, ";", function()
  resizeFrontmostApplication(hs.layout.right50)
end)

-- Triggering system lock + screen saver
hs.hotkey.bind({"cmd", "shift"}, "s", function()
  hs.caffeinate.startScreensaver()
end)

hs.hotkey.bind({"cmd", "shift"}, "l", function()
  hs.caffeinate.lockScreen()
end)

-- Reloading the Hammerspoon conf. should be a breeze
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "r", function()
  hs.reload()
  hs.alert.show("Hammerspoon configuration (re)loaded")
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
hs.hotkey.bind({"cmd", "shift"}, "\\", function()
  hs.hints.windowHints()
end)