# Debugging Setup

## Summary
Add debugging capabilities for various languages using DAP (Debug Adapter Protocol).

## Planned Features
- [ ] Install and configure nvim-dap
- [ ] Add nvim-dap-ui for better debugging interface
- [ ] Configure debug adapters for:
  - [ ] Python (debugpy)
  - [ ] JavaScript/TypeScript (node-debug2)
  - [ ] Lua (for Neovim plugin development)
- [ ] Set up debugging keybindings
- [ ] Create debugging profiles for common scenarios

## Technical Context
Currently, the configuration has excellent LSP support but lacks integrated debugging. Adding DAP support would provide a complete development environment within Neovim.

## Notes
- Consider virtual text for breakpoint indicators
- Ensure debugging doesn't conflict with existing keybindings
- Document debugging workflows for each language