# Renegade Nvim

This is a simple NeoVim setup that gets things going. It contains a handy keymaps, a tree view, LSP and fuzzy finding. Everything a growing developer boy needs.

- [Getting Started](#getting-started)
- [Key Maps](#key-maps)

## Getting Started

Start by making a backup of any existing nvim configs.

```shell
# required
mv ~/.config/nvim ~/.config/nvim.bak

# optional but recommended
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

Now clone this repo.

```shell
git clone https://github.com/chrishumboldt/renegade-nvim.git ~/.config/nvim
```

Remove the git directory as it is not needed.

```shell
rm -rf ~/.config/nvim/.git
```

You are ready to rock and roll.

**NOTE** that once the initial install is complete, you will need to restart nvim.

## Key Maps

Like I was actually going to write down each keymap. Pah. When in nvim just push the `<leader>H` key (in the case of Renegade `leader` = `space`) and the editor will show you a list of keymaps with a description.
