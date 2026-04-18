# New Machine Setup

Execute this plan in order. All commands are fish syntax.

## 1. Bootstrap

Install Xcode Command Line Tools (gets git):

```bash
xcode-select --install
```

Install Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install Rust toolchain (needed for recon, sem-mcp):

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## 2. SSH

Set up SSH key and configure `~/.ssh/config` with the `github.com-personal_key` host alias used by all repo remotes:

```
Host github.com-personal_key
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_personal
```

## 3. Clone repos

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

## 4. Install packages

```bash
brew bundle install --file=~/repos/dotfiles/Brewfile
```

Set fish as default shell:

```bash
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

## 5. Dotfiles symlinks

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
# Compare before linking: diff ~/.claude.json ~/repos/dotfiles/claude/claude.json
ln -sf ~/repos/dotfiles/claude/claude.json ~/.claude.json

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

## 6. Build recon

```bash
cd ~/repos/claude_plugins/recon
cargo install --path .
```

## 7. Build sem-mcp

```bash
cd /tmp && git clone --depth 1 https://github.com/Ataraxy-Labs/sem sem-build
cd sem-build/crates && cargo install --path sem-mcp
claude mcp add -s user sem -- sem-mcp
```

## 8. Install lightpanda (headless browser MCP)

```bash
mkdir -p ~/.local/bin
curl -L -o ~/.local/bin/lightpanda https://github.com/lightpanda-io/browser/releases/download/nightly/lightpanda-aarch64-macos
chmod a+x ~/.local/bin/lightpanda
claude mcp add -s user lightpanda -- ~/.local/bin/lightpanda mcp
```

## 9. Register remaining MCP servers

```bash
claude mcp add -s user chrome-devtools -- npx chrome-devtools-mcp@latest --autoConnect
```

> **Note:** `~/.claude.json` is symlinked from dotfiles (step 5) and contains all user-scoped MCP server registrations. Before symlinking on a new machine, compare the existing `~/.claude.json` (if any) with `~/repos/dotfiles/claude/claude.json` — the dotfiles version is authoritative but the machine may have entries worth merging first.

## 10. Tmux

Start tmux and reload config:

```bash
tmux source-file ~/.tmux.conf
```

## 11. Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

## 12. Verify

```bash
recon --help                        # should show --sidebar flag
sem diff --help                     # should show entity-level diff options
lightpanda --help 2>/dev/null       # should show browser options
tmux list-keys | grep cc-sidebar    # should show prefix+o,s binding
fish -c cc-sidebar-toggle           # should not error
```
