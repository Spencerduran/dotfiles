local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

execute 'packadd packer.nvim'

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    -- UTILITY
    -- icon support
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    -- start page
    use 'mhinz/vim-startify'
end)
