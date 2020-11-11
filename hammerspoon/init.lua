--enable spotlight for app searching
hs.application.enableSpotlightForNameSearches(true)

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
-- Show/hide slack
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "S", function()
  local slack = hs.application.find('slack')
  if slack:isFrontmost() then
    slack:hide()
  else
    hs.application.launchOrFocus("/Applications/Slack.app")
  end
end)
-- Show/hide chrome
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "C", function()
  local chrome = hs.application.find('google chrome')
  if chrome:isFrontmost() then
    chrome:hide()
  else
    hs.application.launchOrFocus("/Applications/google chrome.app")
  end
end)
-- Show/hide firefox
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "F", function()
  local firefox = hs.application.find('firefox')
  if firefox:isFrontmost() then
    firefox:hide()
  else
    hs.application.launchOrFocus("/Applications/firefox.app")
  end
end)
-- Show/hide outlook
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "O", function()
  local outlook = hs.application.find('outlook')
  if outlook:isFrontmost() then
    outlook:hide()
  else
    hs.application.launchOrFocus("/Applications/outlook.app")
  end
end)
-- Show/hide jira
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "J", function()
  local jira = hs.application.find('jira')
  if jira:isFrontmost() then
    jira:hide()
  else
    hs.application.launchOrFocus("/Applications/jira.app")
  end
end)
-- Show/hide zoom
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Z", function()
  local zoom = hs.application.find('zoom')
  if zoom:isFrontmost() then
    zoom:hide()
  else
    hs.application.launchOrFocus("/Applications/zoom.us.app")
  end
end)
-- Show/hide spotify
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "A", function()
  local spotify = hs.application.find('spotify')
  if spotify:isFrontmost() then
    spotify:hide()
  else
    hs.application.launchOrFocus("/Applications/spotify.app")
  end
end)
-- Show/hide postman
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "P", function()
  local postman = hs.application.find('postman')
  if postman:isFrontmost() then
    postman:hide()
  else
    hs.application.launchOrFocus("/Applications/postman.app")
  end
end)

-- Show/hide teams
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "T", function()
  local microsoft_teams= hs.application.find('microsoft teams')
  if microsoft_teams:isFrontmost() then
    microsoft_teams:hide()
  else
    hs.application.launchOrFocus("/Applications/microsoft teams.app")
  end
end)
-- Show/hide Visual Studio Code
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "V", function()
  local visual_studio_code= hs.application.find('code')
  if visual_studio_code:isFrontmost() then
    visual_studio_code:hide()
  else
    hs.application.launchOrFocus("/Applications/visual studio code.app")
  end
end)
