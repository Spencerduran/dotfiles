local hyper = require('hyper')
--enable spotlight for app searching
--hs.application.enableSpotlightForNameSearches(true)
-- Load and install the Hyper key extension. Binding to F18
hyper.install('F18')
-- Quick Reloading of Hammerspoon
hyper.bindShiftKey('r', hs.reload)

-- Show/hide alacritty with 2x ctrl press
ctrlDoublePress = require('ctrlDoublePress')
ctrlDoublePress.timeFrame = 2
ctrlDoublePress.action = function()
  local alacritty = hs.application.find('alacritty')
  if alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus('/Applications/Alacritty.app')
  end
end

-- Show/hide alacritty
hyper.bindKey('a', function()
  local alacritty = hs.application.find('alacritty')
  if alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus('/Applications/Alacritty.app')
  end
end)
-- Show/hide chrome
hyper.bindKey('c', function()
  local chrome = hs.application.find('google chrome')
  if chrome:isFrontmost() then
    chrome:hide()
  else
    hs.application.launchOrFocus('/Applications/google chrome.app')
  end
end)
-- Show/hide Discord
hyper.bindKey('d', function()
  local discord = hs.application.find('discord')
  if discord:isFrontmost() then
    discord:hide()
  else
    hs.application.launchOrFocus('/Applications/discord.app')
  end
end)
-- Show/hide Excel
hyper.bindKey('e', function()
  local outlook = hs.application.find('excel')
  if outlook:isFrontmost() then
    outlook:hide()
  else
    hs.application.launchOrFocus('/Applications/Microsoft Excel.app')
  end
end)
-- Show/hide outlook
hyper.bindKey('o', function()
  local outlook = hs.application.find('outlook')
  if outlook:isFrontmost() then
    outlook:hide()
  else
    hs.application.launchOrFocus('/Applications/Microsoft Outlook.app')
  end
end)
-- Show/hide slack
hyper.bindKey('s', function()
  local slack = hs.application.find('slack')
  if slack:isFrontmost() then
    slack:hide()
  else
    hs.application.launchOrFocus('/Applications/Slack.app')
  end
end)
-- Show/hide pycharm
hyper.bindKey('p', function()
  local postman = hs.application.find('pycharm')
  if postman:isFrontmost() then
    postman:hide()
  else
    hs.application.launchOrFocus('/Applications/pycharm.app')
  end
end)
-- Show/hide postman
--hyper.bindKey('p', function()
--  local postman = hs.application.find('postman')
--  if postman:isFrontmost() then
--    postman:hide()
--  else
--    hs.application.launchOrFocus('/Applications/postman.app')
--  end
--end)
-- Show/hide spotify
hyper.bindKey('q', function()
  local spotify = hs.application.find('spotify')
  if spotify:isFrontmost() then
    spotify:hide()
  else
    hs.application.launchOrFocus('/Applications/Spotify.app')
  end
end)
-- Show/hide firefox
hyper.bindKey('x', function()
  local firefox = hs.application.find('firefox')
  if firefox:isFrontmost() then
    firefox:hide()
  else
    hs.application.launchOrFocus('/Applications/firefox.app')
  end
end)
-- Show/hide zoom
hyper.bindKey('z', function()
  local zoom = hs.application.find('zoom')
  if zoom:isFrontmost() then
    zoom:hide()
  else
    hs.application.launchOrFocus('/Applications/zoom.us.app')
  end
end)

-- Show/hide teams
hyper.bindKey('t', function()
  local microsoft_teams= hs.application.find('teams')
  if microsoft_teams:isFrontmost() then
    microsoft_teams:hide()
  else
    hs.application.launchOrFocus('/Applications/Microsoft Teams.app')
  end
end)
-- Show/hide Visual Studio Code
hyper.bindKey('v', function()
  local visual_studio_code= hs.application.find('code')
  if visual_studio_code:isFrontmost() then
    visual_studio_code:hide()
  else
    hs.application.launchOrFocus('/Applications/visual studio code.app')
  end
end)

local wm = require('window-management')
-- Window Management
--
hyper.bindShiftKey('f', function()
  hs.window.focusedWindow():setSize(3600,1920)
end)

hyper.bindKey('f', function()
  wm.windowMaximize(0)
end)

---------------- MOVEMENT
hyper.bindShiftKey('h', function()
  hs.window.focusedWindow():moveOneScreenWest()
end)
hyper.bindShiftKey('l', function()
  hs.window.focusedWindow():moveOneScreenEast()
end)
---------------- HALFS
hyper.bindKey('h', function()
  wm.moveWindowToPosition(wm.screenPositions.left)
end)
hyper.bindKey('j', function()
  wm.moveWindowToPosition(wm.screenPositions.bottom)
end)
hyper.bindKey('k', function()
  wm.moveWindowToPosition(wm.screenPositions.top)
end)
hyper.bindKey('l', function()
  wm.moveWindowToPosition(wm.screenPositions.right)
end)
hyper.bindKey('l', function()
  wm.moveWindowToPosition(wm.screenPositions.right)
end)
---------------- THIRDS
hyper.bindShiftKey('1', function()
  wm.moveWindowToPosition(wm.screenPositions.thirdleft)
end)
hyper.bindShiftKey('2', function()
  wm.moveWindowToPosition(wm.screenPositions.mid)
end)
hyper.bindShiftKey('3', function()
  wm.moveWindowToPosition(wm.screenPositions.thirdright)
end)
---------------- CORNERS
hyper.bindKey('1', function()
  wm.moveWindowToPosition(wm.screenPositions.topLeft)
end)
hyper.bindKey('2', function()
  wm.moveWindowToPosition(wm.screenPositions.topRight)
end)
hyper.bindKey('3', function()
  wm.moveWindowToPosition(wm.screenPositions.bottomLeft)
end)
hyper.bindKey('4', function()
  wm.moveWindowToPosition(wm.screenPositions.bottomRight)
end)
