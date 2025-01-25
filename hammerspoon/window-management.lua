local This = {}
-- To easily layout windows on the screen, use hs.grid to create
-- a 4x4 grid. To use a more detailed grid, change its dimension here
local GRID_SIZE = 4
local HALF_GRID_SIZE = GRID_SIZE / 2
local THIRD_GRID_SIZE = GRID_SIZE / 3
local QUARTER_GRID_SIZE = GRID_SIZE / 4
local SILLY_GRID_SIZE = GRID_SIZE / 12
local QUARTER_THIRD_GRID_SIZE = GRID_SIZE / 4 + QUARTER_GRID_SIZE

-- Set the grid size and add a few pixels of margin
-- Also, don't animate window changes.
hs.grid.setGrid(GRID_SIZE .. "x" .. GRID_SIZE)
hs.grid.setMargins({ 5, 5 })
hs.window.animationDuration = 0

local screenPositions = {}
-- Quarter Windows
screenPositions.quarterleft = {
	x = 0,
	y = 0,
	w = QUARTER_GRID_SIZE,
	h = GRID_SIZE,
}
screenPositions.topLeftQuarter = {
	x = 0,
	y = 0,
	w = QUARTER_GRID_SIZE,
	h = HALF_GRID_SIZE,
}
screenPositions.bottomLeftQuarter = {
	x = 0,
	y = HALF_GRID_SIZE,
	w = QUARTER_GRID_SIZE,
	h = HALF_GRID_SIZE,
}
screenPositions.bottomRightQuarter = {
	x = QUARTER_GRID_SIZE + QUARTER_GRID_SIZE + QUARTER_GRID_SIZE,
	y = HALF_GRID_SIZE,
	w = QUARTER_GRID_SIZE,
	h = HALF_GRID_SIZE,
}
screenPositions.topRightQuarter = {
	x = QUARTER_GRID_SIZE + QUARTER_GRID_SIZE + QUARTER_GRID_SIZE,
	y = 0,
	w = QUARTER_GRID_SIZE,
	h = HALF_GRID_SIZE,
}
screenPositions.midleft = {
	x = QUARTER_GRID_SIZE,
	y = 0,
	w = QUARTER_GRID_SIZE,
	h = GRID_SIZE,
}
screenPositions.midright = {
	x = QUARTER_GRID_SIZE + QUARTER_GRID_SIZE,
	y = 0,
	w = QUARTER_GRID_SIZE,
	h = GRID_SIZE,
}
screenPositions.quarterright = {
	x = QUARTER_GRID_SIZE + QUARTER_GRID_SIZE + QUARTER_GRID_SIZE,
	y = 0,
	w = QUARTER_GRID_SIZE,
	h = GRID_SIZE,
}
screenPositions.midmid = {
	x = QUARTER_GRID_SIZE,
	y = 0,
	w = QUARTER_GRID_SIZE + QUARTER_GRID_SIZE,
	h = GRID_SIZE,
}

-- Third Windows
screenPositions.thirdleft = {
	x = 0,
	y = 0,
	w = THIRD_GRID_SIZE,
	h = GRID_SIZE,
}
screenPositions.topLeftthird = {
	x = 0,
	y = 0,
	w = THIRD_GRID_SIZE,
	h = HALF_GRID_SIZE,
}
screenPositions.bottomLeftthird = {
	x = 0,
	y = HALF_GRID_SIZE,
	w = THIRD_GRID_SIZE,
	h = HALF_GRID_SIZE,
}
screenPositions.mid = {
	x = THIRD_GRID_SIZE,
	y = 0,
	w = SILLY_GRID_SIZE * 5,
	h = GRID_SIZE,
}
screenPositions.thirdright = {
	x = THIRD_GRID_SIZE + THIRD_GRID_SIZE,
	y = 0,
	w = THIRD_GRID_SIZE,
	h = GRID_SIZE,
}
-- Half Windows
screenPositions.left = {
	x = 0,
	y = 0,
	w = HALF_GRID_SIZE,
	h = GRID_SIZE,
}
screenPositions.halfleft = {
	x = 0,
	y = 0,
	w = HALF_GRID_SIZE,
	h = GRID_SIZE,
}
screenPositions.right = {
	x = HALF_GRID_SIZE,
	y = 0,
	w = HALF_GRID_SIZE,
	h = GRID_SIZE,
}
screenPositions.top = {
	x = 0,
	y = 0,
	w = GRID_SIZE,
	h = HALF_GRID_SIZE,
}
screenPositions.bottom = {
	x = 0,
	y = HALF_GRID_SIZE,
	w = GRID_SIZE,
	h = HALF_GRID_SIZE,
}
screenPositions.topLeft = {
	x = 0,
	y = 0,
	w = HALF_GRID_SIZE,
	h = HALF_GRID_SIZE,
}
screenPositions.topRight = {
	x = HALF_GRID_SIZE,
	y = 0,
	w = HALF_GRID_SIZE,
	h = HALF_GRID_SIZE,
}
screenPositions.bottomLeft = {
	x = 0,
	y = HALF_GRID_SIZE,
	w = HALF_GRID_SIZE,
	h = HALF_GRID_SIZE,
}
screenPositions.bottomRight = {
	x = HALF_GRID_SIZE,
	y = HALF_GRID_SIZE,
	w = HALF_GRID_SIZE,
	h = HALF_GRID_SIZE,
}
This.screenPositions = screenPositions

-- This function will move either the specified or the focuesd
-- window to the requested screen position
function This.moveWindowToPosition(cell, window)
	if window == nil then
		window = hs.window.focusedWindow()
	end
	if window then
		local screen = window:screen()
		hs.grid.set(window, cell, screen)
	end
end
-- This function will move either the specified or the focused
-- window to the center of the sreen and let it fill up the
-- entire screen.
function This.windowMaximize(factor, window)
	if window == nil then
		window = hs.window.focusedWindow()
	end
	if window then
		window:maximize()
	end
end
return This
