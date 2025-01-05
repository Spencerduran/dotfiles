--arrangeDesktop = hs.loadSpoon('ArrangeDesktop')
--arrangeDesktop.logger.setLogLevel('info')
--menubar = hs.menubar.new()
--if menubar then
--    menubar:setIcon(hs.image.imageFromName("NSHandCursor"))
--    local menuItems = {}
--    menuItems = arrangeDesktop:addMenuItems(menuItems)
--    menubar:setMenu(menuItems)
--end

hyper = hs.hotkey.modal.new({}, "F17")

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
		hs.eventtap.keyStroke({}, "ESCAPE")
	end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, "F18", enterHyperMode, exitHyperMode)

-----------------------
-- Quick Reloading of Hammerspoon --
-----------------------
hyper:bind({ "shift" }, "r", hs.reload)

-----------------------
--   APP SWITCHER    --
-----------------------
--enable spotlight for app searching
--hs.application.enableSpotlightForNameSearches(true)

---- Show/hide alacritty
-- Show/hide alacritty with 2x ctrl press
ctrlDoublePress = require("ctrlDoublePress")
ctrlDoublePress.timeFrame = 2
ctrlDoublePress.action = function()
	local alacritty = hs.application.find("alacritty")
	if alacritty:isFrontmost() then
		alacritty:hide()
	else
		hs.application.launchOrFocus("/Applications/Alacritty.app")
	end
end
hyper:bind({}, "a", function()
	local alacritty = hs.application.find("alacritty")
	if alacritty:isFrontmost() then
		alacritty:hide()
		hyper.triggered = true
	else
		hs.application.launchOrFocus("/Applications/Alacritty.app")
		hyper.triggered = true
	end
end)
-- Show/hide Brave
hyper:bind({}, "b", function()
	local chrome = hs.application.find("brave")
	if chrome:isFrontmost() then
		chrome:hide()
	else
		hs.application.launchOrFocus("/Applications/Brave Browser.app/")
	end
end)
-- Show/hide chrome
hyper:bind({}, "c", function()
	local chrome = hs.application.find("google chrome")
	if chrome:isFrontmost() then
		chrome:hide()
	else
		hs.application.launchOrFocus("/Applications/google chrome.app")
	end
end)
-- Show/hide Discord
hyper:bind({}, "d", function()
	local discord = hs.application.find("discord")
	if discord:isFrontmost() then
		discord:hide()
	else
		hs.application.launchOrFocus("/Applications/discord.app")
	end
end)
-- Show/hide Excel
hyper:bind({}, "e", function()
	local excel = hs.application.find("excel")
	if excel:isFrontmost() then
		excel:hide()
	else
		hs.application.launchOrFocus("/Applications/Microsoft Excel.app")
	end
end)
-- Show/hide Kindle
hyper:bind({}, "k", function()
	local excel = hs.application.find("kindle")
	if excel:isFrontmost() then
		excel:hide()
	else
		hs.application.launchOrFocus("/Applications/Kindle.app")
	end
end)
-- Show/hide Messages
hyper:bind({}, "m", function()
	local excel = hs.application.find("Messages")
	if excel:isFrontmost() then
		excel:hide()
	else
		hs.application.launchOrFocus("/Applications/Messages.app")
	end
end)
-- Show/hide outlook
hyper:bind({}, "o", function()
	local outlook = hs.application.find("outlook")
	if outlook:isFrontmost() then
		outlook:hide()
	else
		hs.application.launchOrFocus("/Applications/Microsoft Outlook.app")
	end
end)
-- Show/hide postman
hyper:bind({}, "p", function()
	local postman = hs.application.find("parallels")
	if postman:isFrontmost() then
		postman:hide()
	else
		hs.application.launchOrFocus("/Applications/Parallels Desktop.app")
	end
end)
-- Show/hide pycharm
--hyper:bind({}, 'y', function()
--  local postman = hs.application.find('pycharm')
--  if postman:isFrontmost() then
--    postman:hide()
--  else
--    hs.application.launchOrFocus('/Applications/pycharm.app')
--  end
--end)
-- Show/hide spotify
hyper:bind({}, "q", function()
	local spotify = hs.application.find("spotify")
	if spotify:isFrontmost() then
		spotify:hide()
	else
		hs.application.launchOrFocus("/Users/spencer/Applications/Spotify.app")
	end
end)
-- Show/hide Acrobat Reader
hyper:bind({}, "r", function()
	local slack = hs.application.find("reader")
	if slack:isFrontmost() then
		slack:hide()
	else
		hs.application.launchOrFocus("/Applications/Adobe Acrobat Reader.app")
	end
end)
-- Show/hide Tradingview
hyper:bind({}, "s", function()
	local slack = hs.application.find("slack")
	if slack:isFrontmost() then
		slack:hide()
	else
		hs.application.launchOrFocus("/Applications/Slack.app")
	end
end)
-- Show/hide teams
hyper:bind({}, "t", function()
	local microsoft_teams = hs.application.find("teams")
	if microsoft_teams:isFrontmost() then
		microsoft_teams:hide()
	else
		hs.application.launchOrFocus("/Applications/Microsoft Teams.app")
	end
end)
-- Show/hide Tradingview
hyper:bind({ "shift" }, "t", function()
	local slack = hs.application.find("tradingview")
	if slack:isFrontmost() then
		slack:hide()
	else
		hs.application.launchOrFocus("/Applications/TradingView.app")
	end
end)
-- Show/hide Visual Studio Code
hyper:bind({}, "v", function()
	local visual_studio_code = hs.application.find("code")
	if visual_studio_code:isFrontmost() then
		visual_studio_code:hide()
	else
		hs.application.launchOrFocus("/Applications/visual studio code.app")
	end
end)
-- Show/hide teams
hyper:bind({}, "w", function()
	local microsoft_teams = hs.application.find("word")
	if microsoft_teams:isFrontmost() then
		microsoft_teams:hide()
	else
		hs.application.launchOrFocus("/Applications/Microsoft Word.app")
	end
end)
-- Show/hide firefox
hyper:bind({}, "x", function()
	local firefox = hs.application.find("firefox")
	if firefox:isFrontmost() then
		firefox:hide()
	else
		hs.application.launchOrFocus("/Applications/firefox.app")
	end
end)
-- Show/hide zoom
hyper:bind({}, "z", function()
	local zoom = hs.application.find("zoom")
	if zoom:isFrontmost() then
		zoom:hide()
	else
		hs.application.launchOrFocus("/Applications/zoom.us.app")
	end
end)

-----------------------
-- Window Management --
-----------------------
local wm = require("window-management")
------------------ MOVEMENT
hyper:bind({ "shift" }, "h", function()
	hs.window.focusedWindow():moveOneScreenWest()
end)
hyper:bind({ "shift" }, "l", function()
	hs.window.focusedWindow():moveOneScreenEast()
end)

------------------ FULLSCREEN
hyper:bind({}, "f", function()
	wm.windowMaximize(0)
end)
hyper:bind({}, "return", function()
	wm.windowMaximize(0)
	hyper.triggered = true
end)
hyper:bind({}, "0", function()
	wm.moveWindowToPosition(wm.screenPositions.midmid)
end)

------------------ HALVES
hyper:bind({}, "h", function()
	wm.moveWindowToPosition(wm.screenPositions.left)
end)
hyper:bind({}, "j", function()
	wm.moveWindowToPosition(wm.screenPositions.bottom)
end)
--hyper:bind({}, 'k', function()
--  wm.moveWindowToPosition(wm.screenPositions.top)
--end)
hyper:bind({}, "l", function()
	wm.moveWindowToPosition(wm.screenPositions.right)
end)
------------------ THIRDS
hyper:bind({}, "1", function()
	wm.moveWindowToPosition(wm.screenPositions.thirdleft)
end)
hyper:bind({}, "2", function()
	wm.moveWindowToPosition(wm.screenPositions.mid)
end)
hyper:bind({}, "3", function()
	wm.moveWindowToPosition(wm.screenPositions.thirdright)
end)
hyper:bind({}, "4", function()
	wm.moveWindowToPosition(wm.screenPositions.topLeftthird)
end)
hyper:bind({}, "5", function()
	wm.moveWindowToPosition(wm.screenPositions.bottomLeftthird)
end)
------------------ QUARTERS
hyper:bind({ "shift" }, "1", function()
	wm.moveWindowToPosition(wm.screenPositions.quarterleft)
end)
hyper:bind({ "shift" }, "2", function()
	wm.moveWindowToPosition(wm.screenPositions.midleft)
end)
hyper:bind({ "shift" }, "3", function()
	wm.moveWindowToPosition(wm.screenPositions.midright)
end)
hyper:bind({ "shift" }, "4", function()
	wm.moveWindowToPosition(wm.screenPositions.quarterright)
end)
hyper:bind({ "shift" }, "5", function()
	wm.moveWindowToPosition(wm.screenPositions.topLeftQuarter)
end)
hyper:bind({ "shift" }, "6", function()
	wm.moveWindowToPosition(wm.screenPositions.bottomLeftQuarter)
end)
hyper:bind({ "shift" }, "7", function()
	wm.moveWindowToPosition(wm.screenPositions.topRightQuarter)
end)
hyper:bind({ "shift" }, "8", function()
	wm.moveWindowToPosition(wm.screenPositions.bottomRightQuarter)
end)
------------------ CORNERS
hyper:bind({}, "6", function()
	wm.moveWindowToPosition(wm.screenPositions.topLeft)
end)
hyper:bind({}, "7", function()
	wm.moveWindowToPosition(wm.screenPositions.topRight)
end)
hyper:bind({}, "8", function()
	wm.moveWindowToPosition(wm.screenPositions.bottomLeft)
end)
hyper:bind({}, "9", function()
	local win = hs.window.focusedWindow()
	if win then
		local frame = win:frame()
		frame.w = 1920
		frame.h = 1080
		win:setFrame(frame)
	end
end)

-------------------------------------------
-- Chrome Window Highlight --
-------------------------------------------
local function drawBorder()
	local win = hs.window.focusedWindow()
	if win and win:application():name() == "Google Chrome" then
		if not border then
			border = hs.canvas.new(win:frame())
		end
		border:frame(win:frame())
		border[1] = {
			type = "rectangle",
			strokeColor = { red = 1, blue = 1, green = 0, alpha = 0.8 },
			strokeWidth = 4,
			action = "stroke",
		}
		border:show()
	elseif border then
		border:hide()
	end
end

windowFilter = hs.window.filter.new(false)
windowFilter:setAppFilter("Google Chrome", { allowRoles = "AXStandardWindow" })
windowFilter:subscribe(hs.window.filter.windowFocused, drawBorder)
windowFilter:subscribe(hs.window.filter.windowMoved, drawBorder)
