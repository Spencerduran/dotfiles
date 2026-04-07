# New Machine Setup

Execute this plan in order. All commands are fish syntax.

## Prerequisites

Install Homebrew, then:

```bash
brew install fish tmux neovim git gh stow
brew install --cask alacritty hammerspoon
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Set fish as default shell:

```bash
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

## SSH

Set up SSH key and configure `~/.ssh/config` with the `github.com-personal_key` host alias used by all repo remotes:

```
Host github.com-personal_key
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_personal
```

## Clone repos

```bash
mkdir -p ~/repos/obsidian_plugins ~/repos/claude_plugins

# dotfiles
git clone git@github.com-personal_key:Spencerduran/dotfiles.git ~/repos/dotfiles

# obsidian plugins
git clone git@github.com-personal_key:Spencerduran/obsidian-reading-view-enhancer.git ~/repos/obsidian_plugins/obsidian-reading-view-enhancer
git clone git@github.com-personal_key:Spencerduran/tasknotes.git ~/repos/obsidian_plugins/tasknotes

# claude plugins
git clone git@github.com-personal_key:Spencerduran/recon.git ~/repos/claude_plugins/recon
git clone git@github.com-personal_key:6m1w/claude-sound-fx.git ~/repos/claude_plugins/claude-sound-fx
```

## Dotfiles symlinks

```bash
# Home directory
ln -sf ~/repos/dotfiles/alacritty/.alacritty.toml ~/.alacritty.toml
ln -sf ~/repos/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Neovim
mkdir -p ~/.config
ln -sf ~/repos/dotfiles/nvim ~/.config/nvim

# Claude
mkdir -p ~/.claude
ln -sf ~/repos/dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -sf ~/repos/dotfiles/claude/commands ~/.claude/commands
ln -sf ~/repos/dotfiles/claude/settings.json ~/.claude/settings.json

# Hammerspoon
mkdir -p ~/.hammerspoon
ln -sf ~/repos/dotfiles/hammerspoon/init.lua ~/.hammerspoon/init.lua
ln -sf ~/repos/dotfiles/hammerspoon/hyper.lua ~/.hammerspoon/hyper.lua
ln -sf ~/repos/dotfiles/hammerspoon/ctrlDoublePress.lua ~/.hammerspoon/ctrlDoublePress.lua
ln -sf ~/repos/dotfiles/hammerspoon/window-management.lua ~/.hammerspoon/window-management.lua

# Fish functions (individual symlinks)
mkdir -p ~/.config/fish/functions
ln -sf ~/repos/dotfiles/fish/functions/cc-sidebar.fish ~/.config/fish/functions/cc-sidebar.fish
ln -sf ~/repos/dotfiles/fish/functions/cc-sidebar-toggle.fish ~/.config/fish/functions/cc-sidebar-toggle.fish
ln -sf ~/repos/dotfiles/fish/functions/cc-sidebar-ensure.fish ~/.config/fish/functions/cc-sidebar-ensure.fish
```

## Build recon

```bash
cd ~/repos/claude_plugins/recon
cargo install --path .
```

## Tmux

Start tmux and reload config:

```bash
tmux source-file ~/.tmux.conf
```

## Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

## Verify

```bash
recon --help          # should show --sidebar flag
tmux list-keys | grep cc-sidebar   # should show prefix+o,s binding
fish -c cc-sidebar-toggle          # should not error
```
