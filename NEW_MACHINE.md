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

Install Rust toolchain (needed for recon):

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

Install bun (claude-hud statusline, claude-mem) and qmd (SessionStart hook, /recall):

```bash
curl -fsSL https://bun.sh/install | bash
npm install -g @tobilu/qmd
qmd collection add ~/vaults/claude_memory/claude-sessions-qmd --name sessions
qmd collection add ~/vaults/claude_memory/Notes/Projects/claude-sessions-qmd --name sessions-archive
qmd collection add ~/vaults/claude_memory/transcripts --name transcripts
qmd collection add ~/vaults/mind_forge --name notes
qmd embed
```

claude-mem installs its `claude-mem` launcher (`~/.local/bin`) on the first Claude Code session after the plugin is enabled. Check it with `claude-mem status`.

Set fish as default shell:

```bash
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

## 5. Dotfiles symlinks

```bash
# Home directory
ln -sf ~/repos/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/repos/dotfiles/git/.gitconfig-mlg ~/.gitconfig-mlg
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

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf ~/repos/dotfiles/ghostty/config ~/.config/ghostty/config

# Hammerspoon
mkdir -p ~/.hammerspoon
ln -sf ~/repos/dotfiles/hammerspoon/init.lua ~/.hammerspoon/init.lua
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

## 7. Register MCP servers

```bash
fish ~/repos/dotfiles/claude/mcp-servers.fish
```

> `~/.claude.json` is NOT symlinked from dotfiles — Claude Code rewrites it constantly (feature-flag cache, telemetry, migration state), so a live symlink causes git conflicts on every machine. `claude/mcp-servers.fish` is the source of truth for local MCP server registrations instead; it's idempotent, so re-run it on any machine after adding a new server to pick up the change.

## 8. Tmux

Start tmux and reload config:

```bash
tmux source-file ~/.tmux.conf
```

## 9. Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

## 10. Verify

```bash
recon --help                        # should show --sidebar flag
tmux list-keys | grep cc-sidebar    # should show prefix+o,s binding
fish -c cc-sidebar-toggle           # should not error
```
