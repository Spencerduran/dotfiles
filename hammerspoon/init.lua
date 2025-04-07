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
hs.application.enableSpotlightForNameSearches(true)

-- Show/hide Claude with 2x ctrl press
ctrlDoublePress = require("ctrlDoublePress")
ctrlDoublePress.timeFrame = 2
ctrlDoublePress.action = function()
	local claude = hs.application.find("Claude")

	if claude then
		if claude:isFrontmost() then
			claude:hide()
		else
			claude:activate()
		end
	else
		hs.application.launchOrFocus("/Applications/Claude.app")
	end
end

--hyper:bind({}, "k", function()
--	local claude = hs.application.find("Claude")
--
--	-- Function to get main window of an application
--	local function getMainWindow(app)
--		if app then
--			return app:mainWindow()
--		end
--		return nil
--	end
--
--	if claude then
--		if claude:isFrontmost() then
--			claude:hide()
--		else
--			-- Store current frontmost window's frame before switching
--			local currentApp = hs.application.frontmostApplication()
--			local currentFrame = getMainWindow(currentApp):frame()
--
--			claude:activate()
--
--			-- Apply the frame to Claude's window
--			hs.timer.doAfter(0.1, function()
--				local claudeWindow = getMainWindow(claude)
--				if claudeWindow then
--					claudeWindow:setFrame(currentFrame)
--				end
--			end)
--		end
--	else
--		hs.application.launchOrFocus("/Applications/Claude.app")
--	end
--
--	hyper.triggered = true
--end)
hyper:bind({}, "k", function()
	local claude = hs.application.find("Claude")
	if claude:isFrontmost() then
		claude:hide()
		hyper.triggered = true
	else
		hs.application.launchOrFocus("/Applications/Claude.app")
		hyper.triggered = true
	end
end)

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

-- Show/hide Obsidian
hyper:bind({}, "b", function()
	local chrome = hs.application.find("obsidian")
	if chrome:isFrontmost() then
		chrome:hide()
	else
		hs.application.launchOrFocus("/Applications/Obsidian.app/")
	end
end)
--hyper:bind({}, "p", function()
--	local alacritty = hs.application.find("alacritty")
--	local obsidian = hs.application.find("obsidian")
--
--	-- Function to get main window of an application
--	local function getMainWindow(app)
--		if app then
--			return app:mainWindow()
--		end
--		return nil
--	end
--
--	-- Function to hide overlapping windows
--	local function hideOverlappingWindows(frontWindow)
--		local allWindows = hs.window.orderedWindows()
--		for i = 2, #allWindows do
--			local window = allWindows[i]
--			if window and window:isVisible() then
--				local frontFrame = frontWindow:frame()
--				local backFrame = window:frame()
--
--				-- Check for overlap
--				local overlap = not (
--					backFrame.x >= frontFrame.x + frontFrame.w
--					or backFrame.x + backFrame.w <= frontFrame.x
--					or backFrame.y >= frontFrame.y + frontFrame.h
--					or backFrame.y + backFrame.h <= frontFrame.y
--				)
--
--				if overlap then
--					window:application():hide()
--				end
--			end
--		end
--	end
--
--	-- If Alacritty is frontmost, switch to Obsidian
--	if alacritty and alacritty:isFrontmost() then
--		local currentFrame = getMainWindow(alacritty):frame()
--		alacritty:hide()
--		hs.application.launchOrFocus("/Applications/Obsidian.app/")
--		-- Short delay to ensure window is available
--		hs.timer.doAfter(0.1, function()
--			local obsidianWindow = getMainWindow(obsidian)
--			if obsidianWindow then
--				obsidianWindow:setFrame(currentFrame)
--				hideOverlappingWindows(obsidianWindow)
--			end
--		end)
--
--	-- If Obsidian is frontmost, switch to Alacritty
--	elseif obsidian and obsidian:isFrontmost() then
--		local currentFrame = getMainWindow(obsidian):frame()
--		obsidian:hide()
--		hs.application.launchOrFocus("/Applications/Alacritty.app")
--		-- Short delay to ensure window is available
--		hs.timer.doAfter(0.1, function()
--			local alacrittyWindow = getMainWindow(alacritty)
--			if alacrittyWindow then
--				alacrittyWindow:setFrame(currentFrame)
--				hideOverlappingWindows(alacrittyWindow)
--			end
--		end)
--
--	-- If neither is frontmost, show Alacritty
--	else
--		hs.application.launchOrFocus("/Applications/Alacritty.app")
--	end
--
--	hyper.triggered = true
--end)
hyper:bind({}, "p", function()
	local alacritty = hs.application.find("alacritty")
	local obsidian = hs.application.find("obsidian")

	-- Function to get main window of an application
	local function getMainWindow(app)
		if app then
			return app:mainWindow()
		end
		return nil
	end

	-- Function to hide overlapping windows
	local function hideOverlappingWindows(frontWindow)
		local allWindows = hs.window.orderedWindows()
		for i = 2, #allWindows do
			local window = allWindows[i]
			if window and window:isVisible() then
				local frontFrame = frontWindow:frame()
				local backFrame = window:frame()

				-- Check for overlap
				local overlap = not (
					backFrame.x >= frontFrame.x + frontFrame.w
					or backFrame.x + backFrame.w <= frontFrame.x
					or backFrame.y >= frontFrame.y + frontFrame.h
					or backFrame.y + backFrame.h <= frontFrame.y
				)

				if overlap then
					window:application():hide()
				end
			end
		end
	end

	-- Function to focus app and manage windows
	local function focusAndManageWindows(app, appPath)
		-- If app exists but isn't frontmost
		if app then
			if app:isFrontmost() then
				app:hide()
			else
				-- Get current frontmost window's frame
				local currentApp = hs.application.frontmostApplication()
				local currentWindow = getMainWindow(currentApp)
				local currentFrame = currentWindow and currentWindow:frame()

				-- Focus the app
				hs.application.launchOrFocus(appPath)

				-- After short delay to ensure window is available
				hs.timer.doAfter(0.1, function()
					local appWindow = getMainWindow(app)
					if appWindow then
						-- If we have a frame from previous window, use it
						if currentFrame then
							appWindow:setFrame(currentFrame)
						end
						hideOverlappingWindows(appWindow)
					end
				end)
			end
		else
			-- If app doesn't exist, launch it
			hs.application.launchOrFocus(appPath)
		end
	end

	-- If Alacritty is frontmost, switch to Obsidian
	if alacritty and alacritty:isFrontmost() then
		focusAndManageWindows(obsidian, "/Applications/Obsidian.app/")
	-- Otherwise focus Alacritty
	else
		focusAndManageWindows(alacritty, "/Applications/Alacritty.app")
	end

	hyper.triggered = true
end)
--hyper:bind({}, "p", function()
--	local alacritty = hs.application.find("alacritty")
--	local obsidian = hs.application.find("obsidian")
--
--	-- Function to get main window of an application
--	local function getMainWindow(app)
--		if app then
--			return app:mainWindow()
--		end
--		return nil
--	end
--
--	-- If Alacritty is frontmost, switch to Obsidian
--	if alacritty and alacritty:isFrontmost() then
--		local currentFrame = getMainWindow(alacritty):frame()
--		alacritty:hide()
--		hs.application.launchOrFocus("/Applications/Obsidian.app/")
--		-- Short delay to ensure window is available
--		hs.timer.doAfter(0.1, function()
--			local obsidianWindow = getMainWindow(obsidian)
--			if obsidianWindow then
--				obsidianWindow:setFrame(currentFrame)
--			end
--		end)
--
--	-- If Obsidian is frontmost, switch to Alacritty
--	elseif obsidian and obsidian:isFrontmost() then
--		local currentFrame = getMainWindow(obsidian):frame()
--		obsidian:hide()
--		hs.application.launchOrFocus("/Applications/Alacritty.app")
--		-- Short delay to ensure window is available
--		hs.timer.doAfter(0.1, function()
--			local alacrittyWindow = getMainWindow(alacritty)
--			if alacrittyWindow then
--				alacrittyWindow:setFrame(currentFrame)
--			end
--		end)
--
--	-- If neither is frontmost, show Alacritty
--	else
--		hs.application.launchOrFocus("/Applications/Alacritty.app")
--	end
--
--	hyper.triggered = true
--end)

-- Cycle order: Alacritty -> Obsidian -> Chrome -> Alacritty
hyper:bind({}, "j", function()
	local alacritty = hs.application.find("alacritty")
	local obsidian = hs.application.find("obsidian")
	local chrome = hs.application.find("google chrome")

	-- Function to get main window of an application
	local function getMainWindow(app)
		if app then
			return app:mainWindow()
		end
		return nil
	end

	-- Function to switch to next app with same frame
	local function switchToApp(fromApp, toAppPath)
		local currentFrame = getMainWindow(fromApp):frame()
		fromApp:hide()
		hs.application.launchOrFocus(toAppPath)
		-- Short delay to ensure window is available
		hs.timer.doAfter(0.1, function()
			local toApp = hs.application.find(string.match(toAppPath, "/Applications/(.+).app"))
			local toWindow = getMainWindow(toApp)
			if toWindow then
				toWindow:setFrame(currentFrame)
			end
		end)
	end

	-- If Alacritty is frontmost, switch to Obsidian
	if alacritty and alacritty:isFrontmost() then
		switchToApp(alacritty, "/Applications/Obsidian.app/")

	-- If Obsidian is frontmost, switch to Chrome
	elseif obsidian and obsidian:isFrontmost() then
		switchToApp(obsidian, "/Applications/Google Chrome.app")

	-- If Chrome is frontmost, switch to Alacritty
	elseif chrome and chrome:isFrontmost() then
		switchToApp(chrome, "/Applications/Alacritty.app")

	-- If none are frontmost, show Alacritty
	else
		hs.application.launchOrFocus("/Applications/Alacritty.app")
	end

	hyper.triggered = true
end)
--hyper:bind({}, "p", function()
--	local alacritty = hs.application.find("alacritty")
--	local obsidian = hs.application.find("obsidian")
--
--	-- If Alacritty is frontmost, hide it and show Obsidian
--	if alacritty and alacritty:isFrontmost() then
--		alacritty:hide()
--		hs.application.launchOrFocus("/Applications/Obsidian.app/")
--	-- If Obsidian is frontmost, hide it and show Alacritty
--	elseif obsidian and obsidian:isFrontmost() then
--		obsidian:hide()
--		hs.application.launchOrFocus("/Applications/Alacritty.app")
--	-- If neither is frontmost, show Alacritty
--	else
--		hs.application.launchOrFocus("/Applications/Alacritty.app")
--	end
--
--	hyper.triggered = true
--end)

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
--hyper:bind({}, "k", function()
--	local excel = hs.application.find("kindle")
--	if excel:isFrontmost() then
--		excel:hide()
--	else
--		hs.application.launchOrFocus("/Applications/Kindle.app")
--	end
--end)
-- Show/hide Messages
hyper:bind({}, "m", function()
	local excel = hs.application.find("Messages")
	if excel:isFrontmost() then
		excel:hide()
	else
		hs.application.launchOrFocus("/Applications/Messages.app")
	end
end)
-- Show/hide Outlook
hyper:bind({ "shift" }, "o", function()
	local outlook = hs.application.find("outlook")
	if outlook:isFrontmost() then
		outlook:hide()
	else
		hs.application.launchOrFocus("/Applications/Microsoft Outlook.app")
	end
end)
-- Show/hide Obsidian
hyper:bind({}, "o", function()
	local obsidian = hs.application.find("obsidian")
	if obsidian:isFrontmost() then
		obsidian:hide()
	else
		hs.application.launchOrFocus("/Applications/Obsidian.app/Contents/MacOS/Obsidian")
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
	if spotify then
		if spotify:isFrontmost() then
			spotify:hide()
		else
			spotify:activate()
		end
	else
		hs.application.launchOrFocus("Spotify")
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
--hyper:bind({}, "j", function()
--	wm.moveWindowToPosition(wm.screenPositions.bottom)
--end)

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
-- Window Highlight for Chrome Only --
-- Creates a colored border around Chrome when focused
-------------------------------------------
-- Configuration
local config = {
	strokeColor = { red = 124, blue = 255, green = 0, alpha = 1 },
	strokeWidth = 4,
}

-- Initialize border canvas
local border = nil

local function drawBorder()
	local win = hs.window.focusedWindow()
	if win and win:application():name() == "Google Chrome" then
		-- Create border canvas if it doesn't exist
		if not border then
			border = hs.canvas.new(win:frame())
		end
		-- Update border frame to match window
		border:frame(win:frame())
		-- Set border properties
		border[1] = {
			type = "rectangle",
			strokeColor = config.strokeColor,
			strokeWidth = config.strokeWidth,
			action = "stroke",
		}
		border:show()
	elseif border then
		border:hide()
	end
end

-- Set up window filter specifically for Chrome
local windowFilter = hs.window.filter.new("Google Chrome")
windowFilter:setDefaultFilter({ allowRoles = "AXStandardWindow" })

-- Subscribe to window events
windowFilter:subscribe(hs.window.filter.windowFocused, drawBorder)
windowFilter:subscribe(hs.window.filter.windowMoved, drawBorder)
windowFilter:subscribe(hs.window.filter.windowUnfocused, function()
	if border then
		border:hide()
	end
end)

-- Optional: Add this line if you want the border to update when Chrome windows are resized
windowFilter:subscribe(hs.window.filter.windowsChanged, drawBorder)
