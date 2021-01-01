--enable spotlight for app searching
--hs.application.enableSpotlightForNameSearches(true)

-- A global variable for the Hyper Mode
hyper = hs.hotkey.modal.new({}, 'F17')

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
function enterHyperMode()
  hyper.triggered = false
  hyper:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
-- send ESCAPE if no other keys are pressed.
function exitHyperMode()
  hyper:exit()
  if not hyper.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', enterHyperMode, exitHyperMode)

-- Show/hide alacritty with 2x ctrl press
ctrlDoublePress = require("ctrlDoublePress")
ctrlDoublePress.timeFrame = 2
ctrlDoublePress.action = function()
  local alacritty = hs.application.find('alacritty')
  if alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  end
end
-- Show/hide alacritty
hyper:bind({}, 'a', function()
  local alacritty = hs.application.find('alacritty')
  if alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  end
end)
-- Show/hide slack
hyper:bind({}, 's', function()
  local slack = hs.application.find('slack')
  if slack:isFrontmost() then
    slack:hide()
  else
    hs.application.launchOrFocus("/Applications/Slack.app")
  end
end)
-- Show/hide chrome
hyper:bind({}, 'c', function()
  local chrome = hs.application.find('google chrome')
  if chrome:isFrontmost() then
    chrome:hide()
  else
    hs.application.launchOrFocus("/Applications/google chrome.app")
  end
end)
-- Show/hide firefox
hyper:bind({}, 'x', function()
  local firefox = hs.application.find('firefox')
  if firefox:isFrontmost() then
    firefox:hide()
  else
    hs.application.launchOrFocus("/Applications/firefox.app")
  end
end)
-- Show/hide outlook
hyper:bind({}, 'o', function()
  local outlook = hs.application.find('outlook')
  if outlook:isFrontmost() then
    outlook:hide()
  else
    hs.application.launchOrFocus("/Applications/Microsoft Outlook.app")
  end
end)
-- Show/hide jira
hyper:bind({}, 'j', function()
  local jira = hs.application.find('jira')
  if jira:isFrontmost() then
    jira:hide()
  else
    hs.application.launchOrFocus("/Applications/jira.app")
  end
end)
-- Show/hide zoom
hyper:bind({}, 'z', function()
  local zoom = hs.application.find('zoom')
  if zoom:isFrontmost() then
    zoom:hide()
  else
    hs.application.launchOrFocus("/Applications/zoom.us.app")
  end
end)
-- Show/hide spotify
hyper:bind({}, 'q', function()
  local spotify = hs.application.find('spotify')
  if spotify:isFrontmost() then
    spotify:hide()
  else
    hs.application.launchOrFocus("/Applications/Spotify.app")
  end
end)
-- Show/hide postman
hyper:bind({}, 'p', function()
  local postman = hs.application.find('postman')
  if postman:isFrontmost() then
    postman:hide()
  else
    hs.application.launchOrFocus("/Applications/postman.app")
  end
end)

-- Show/hide teams
hyper:bind({}, 't', function()
  local microsoft_teams= hs.application.find('teams')
  if microsoft_teams:isFrontmost() then
    microsoft_teams:hide()
  else
    hs.application.launchOrFocus("/Applications/Microsoft Teams.app")
  end
end)
-- Show/hide Visual Studio Code
hyper:bind({}, 'v', function()
  local visual_studio_code= hs.application.find('code')
  if visual_studio_code:isFrontmost() then
    visual_studio_code:hide()
  else
    hs.application.launchOrFocus("/Applications/visual studio code.app")
  end
end)
