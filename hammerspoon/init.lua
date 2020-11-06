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
