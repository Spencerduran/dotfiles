-- Disable window animations for instant window switching
hs.window.animationDuration = 0

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

-- Generic app toggle: find, focus/hide, or launch
local function toggleApp(appName, appPath)
	local app = hs.application.find(appName)
	if app then
		if app:isFrontmost() then
			app:hide()
		else
			app:activate()
		end
	else
		hs.application.launchOrFocus(appPath)
	end
	hyper.triggered = true
end

-- Table-driven app switcher bindings
local appBindings = {
	{ key = "a", name = "alacritty", path = "/Applications/Alacritty.app" },
	{ key = "d", name = "discord", path = "/Applications/discord.app" },
	{ key = "e", name = "excel", path = "/Applications/Microsoft Excel.app" },
	{ key = "m", name = "Messages", path = "/System/Applications/Messages.app" },
	{ key = "o", name = "obsidian", path = "/Applications/Obsidian.app" },
	{ key = "q", name = "spotify", path = "/Applications/Spotify.app" },
	{ key = "r", name = "reader", path = "/Applications/Adobe Acrobat Reader.app" },
	{ key = "s", name = "slack", path = "/Applications/Slack.app" },
	{ key = "t", name = "teams", path = "/Applications/Microsoft Teams.app" },
	{ key = "v", name = "code", path = "/Applications/Visual Studio Code.app" },
	{ key = "x", name = "firefox", path = "/Applications/firefox.app" },
	-- Shift bindings
	{ mods = { "shift" }, key = "o", name = "outlook", path = "/Applications/Microsoft Outlook.app" },
	{ mods = { "shift" }, key = "t", name = "tradingview", path = "/Applications/TradingView.app" },
	{ mods = { "shift" }, key = "w", name = "word", path = "/Applications/Microsoft Word.app" },
}

for _, b in ipairs(appBindings) do
	hyper:bind(b.mods or {}, b.key, function()
		toggleApp(b.name, b.path)
	end)
end

-- Show/hide Zoom — prefers meeting window over home window
hyper:bind({}, "z", function()
	local zoom = hs.application.find("zoom")
	if not zoom then
		hs.application.launchOrFocus("/Applications/zoom.us.app")
		hyper.triggered = true
		return
	end

	-- Categorize Zoom windows
	local meetingWindow = nil
	local homeWindow = nil

	for _, win in ipairs(zoom:allWindows()) do
		if win:subrole() == "AXStandardWindow" then
			local title = win:title() or ""
			if title == "Zoom Workplace" or title == "Zoom" then
				homeWindow = win
			else
				meetingWindow = win
			end
		end
	end

	if zoom:isFrontmost() then
		local focused = hs.window.focusedWindow()
		if meetingWindow and focused and focused:id() ~= meetingWindow:id() then
			-- On home window but meeting exists — switch to meeting
			meetingWindow:focus()
		else
			zoom:hide()
		end
	else
		-- Prefer meeting window over home
		if meetingWindow then
			meetingWindow:focus()
		elseif homeWindow then
			homeWindow:focus()
		else
			zoom:activate()
		end
	end

	hyper.triggered = true
end)

-- Alacritty/Obsidian swap (Hyper + P)
hyper:bind({}, "p", function()
	local alacritty = hs.application.find("alacritty")
	local obsidian = hs.application.find("obsidian")

	local function getMainWindow(app)
		if app then
			return app:mainWindow()
		end
		return nil
	end

	local function hideOverlappingWindows(frontWindow)
		local allWindows = hs.window.orderedWindows()
		for i = 2, #allWindows do
			local window = allWindows[i]
			if window and window:isVisible() then
				local frontFrame = frontWindow:frame()
				local backFrame = window:frame()

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

	local function focusAndManageWindows(app, appPath)
		if app then
			if app:isFrontmost() then
				app:hide()
			else
				local currentApp = hs.application.frontmostApplication()
				local currentWindow = getMainWindow(currentApp)
				local currentFrame = currentWindow and currentWindow:frame()

				hs.application.launchOrFocus(appPath)

				hs.timer.doAfter(0.1, function()
					local appWindow = getMainWindow(app)
					if appWindow then
						if currentFrame then
							appWindow:setFrame(currentFrame)
						end
						hideOverlappingWindows(appWindow)
					end
				end)
			end
		else
			hs.application.launchOrFocus(appPath)
		end
	end

	if alacritty and alacritty:isFrontmost() then
		focusAndManageWindows(obsidian, "/Applications/Obsidian.app/")
	else
		focusAndManageWindows(alacritty, "/Applications/Alacritty.app")
	end

	hyper.triggered = true
end)

-- Chrome profile window management (stateless, title-based matching)
local chromeProfiles = {
	{ key = "c", name = "Spencer", dir = "Default" },
	{ key = "w", name = "Spencer (Work)", dir = "Profile 5" },
}

local function switchChromeProfile(profileName, profileDir, minimizeOthers)
	local chrome = hs.application.find("Google Chrome")

	-- Chrome not running — launch with profile
	if not chrome then
		hs.execute('open -a "Google Chrome" --args --profile-directory="' .. profileDir .. '"')
		return
	end

	-- Collect windows whose title ends with " - profileName" (standard windows only)
	local pattern = " %- " .. profileName:gsub("([%(%)%.%%%+%-%*%?%[%]%^%$])", "%%%1") .. "$"
	local matches = {}
	for _, win in ipairs(chrome:allWindows()) do
		if win:subrole() == "AXStandardWindow" and (win:title() or ""):match(pattern) then
			matches[#matches + 1] = win
		end
	end

	-- Sort by window ID for consistent cycling order
	table.sort(matches, function(a, b)
		return a:id() < b:id()
	end)

	-- No matching windows — launch with profile directory
	if #matches == 0 then
		hs.execute('open -a "Google Chrome" --args --profile-directory="' .. profileDir .. '"')
		return
	end

	local focused = hs.window.focusedWindow()
	local didHide = false

	if chrome:isFrontmost() then
		-- Check if focused window belongs to this profile
		local focusedIdx = nil
		for i, win in ipairs(matches) do
			if focused and win:id() == focused:id() then
				focusedIdx = i
				break
			end
		end

		if focusedIdx then
			if #matches == 1 then
				chrome:hide()
				didHide = true
			else
				-- Cycle to next window in this profile
				local nextIdx = (focusedIdx % #matches) + 1
				matches[nextIdx]:focus()
			end
		else
			-- Focused window is a different profile — switch to this one
			matches[1]:focus()
		end
	else
		-- Chrome not frontmost — focus first matching window
		matches[1]:focus()
	end

	-- Minimize other profiles' windows
	if minimizeOthers and not didHide then
		for _, win in ipairs(chrome:allWindows()) do
			if win:subrole() == "AXStandardWindow" then
				local isMatch = false
				for _, m in ipairs(matches) do
					if m:id() == win:id() then
						isMatch = true
						break
					end
				end
				if not isMatch then
					win:minimize()
				end
			end
		end
	end
end

-- Debug: show Chrome windows with profile info from titles (Hyper + Shift + D)
hyper:bind({ "shift" }, "d", function()
	local chrome = hs.application.find("Google Chrome")
	if not chrome then
		hs.alert.show("Chrome not running")
		hyper.triggered = true
		return
	end

	local info = "Chrome Windows:\n"
	for i, window in ipairs(chrome:allWindows()) do
		local title = window:title() or "no title"
		local subrole = window:subrole() or "?"
		local tag = subrole == "AXStandardWindow" and "[REAL]" or "[companion]"
		local profile = ""
		for _, p in ipairs(chromeProfiles) do
			local pat = " %- " .. p.name:gsub("([%(%)%.%%%+%-%*%?%[%]%^%$])", "%%%1") .. "$"
			if title:match(pat) then
				profile = " [" .. p.name .. "]"
				break
			end
		end
		info = info .. i .. ": " .. tag .. profile .. " " .. title .. "\n"
	end
	hs.alert.show(info, 5)
	hyper.triggered = true
end)

-- Bind hotkeys from profiles table
for _, profile in ipairs(chromeProfiles) do
	-- Hyper + key: focus profile, leave other windows alone
	hyper:bind({}, profile.key, function()
		switchChromeProfile(profile.name, profile.dir, false)
		hyper.triggered = true
	end)
	-- Hyper + Shift + key: focus profile, minimize other profiles' windows
	hyper:bind({ "shift" }, profile.key, function()
		switchChromeProfile(profile.name, profile.dir, true)
		hyper.triggered = true
	end)
end

-----------------------
-- Window Management --
-----------------------
local wm = require("window-management")
------------------ MOVEMENT
hyper:bind({ "shift" }, "h", function()
	wm.moveWindowToPosition(wm.screenPositions.fullLeft)
end)
hyper:bind({ "shift" }, "l", function()
	wm.moveWindowToPosition(wm.screenPositions.fullRight)
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
	wm.moveWindowToPosition(wm.screenPositions.midbottom)
end)
hyper:bind({ "shift" }, "j", function()
	wm.moveWindowToPosition(wm.screenPositions.bottom)
end)
hyper:bind({ "shift" }, "k", function()
	wm.moveWindowToPosition(wm.screenPositions.top)
end)
hyper:bind({}, "k", function()
	wm.moveWindowToPosition(wm.screenPositions.midtop)
end)
hyper:bind({}, "l", function()
	wm.moveWindowToPosition(wm.screenPositions.right)
end)
------------------ GRID POSITIONS
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
	wm.moveWindowToPosition(wm.screenPositions.bottomRightthird)
end)
hyper:bind({}, "5", function()
	wm.moveWindowToPosition(wm.screenPositions.quarterleft)
end)
hyper:bind({}, "6", function()
	wm.moveWindowToPosition(wm.screenPositions.quarterright)
end)
hyper:bind({}, "7", function()
	wm.moveWindowToPosition(wm.screenPositions.midleft)
end)
hyper:bind({}, "8", function()
	wm.moveWindowToPosition(wm.screenPositions.midright)
end)
hyper:bind({ "shift" }, "1", function()
	wm.moveWindowToPosition(wm.screenPositions.topLeft)
end)
hyper:bind({ "shift" }, "2", function()
	wm.moveWindowToPosition(wm.screenPositions.topRight)
end)
hyper:bind({ "shift" }, "3", function()
	wm.moveWindowToPosition(wm.screenPositions.bottomLeft)
end)
hyper:bind({ "shift" }, "4", function()
	wm.moveWindowToPosition(wm.screenPositions.bottomRight)
end)

-------------------------------------------
-- Window Highlight for Chrome Only --
-- Creates a colored border around Chrome when focused
-------------------------------------------
local config = {
	strokeColor = { red = 124 / 255, blue = 255 / 255, green = 0, alpha = 1 },
	strokeWidth = 4,
}

local border = nil

local function drawBorder()
	local win = hs.window.focusedWindow()
	if win and win:application():name() == "Google Chrome" then
		if not border then
			border = hs.canvas.new(win:frame())
		end
		border:frame(win:frame())
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
windowFilter:subscribe(hs.window.filter.windowsChanged, drawBorder)
