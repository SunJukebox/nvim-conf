# nvim-conf

My Neovim Configuration (depends on [AstroVim](https://github.com/kabinspace/AstroVim)).

Most of the code has been ~~stolen from~~ inspired by [mehalter's personal config](https://git.mehalter.com/mehalter/AstroVim_user) and [mathjiajia's Neovim config](https://github.com/mathjiajia/config.nvim).

## Installation

1. Download AstroVim

Linux:
```sh
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

Windows:
```pwsh
git clone https://github.com/kabinspace/AstroVim ~/AppData/Local/nvim
```

2. Download config

Linux:
```sh
git clone https://github.com/SunJukebox/nvim-conf ~/.config/nvim/user
```

Windows:
```pwsh
git clone https://github.com/SunJukebox/nvim-conf ~/AppData/Local/nvim/lua/user
```

3. Initial run

```sh
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

