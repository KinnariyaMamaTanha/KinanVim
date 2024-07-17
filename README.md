# KinanVim

> My pure lua configuration of neovim on ubuntu22.04(WSL2). You can also see my viml configuration for both vim and neovim at [KinaVim](https://github.com/KinnariyaMamaTanha/KinaVim). Pay attention that there is only one different character 'n' between the name 'Kinavim' and 'kinanVim', and 'KinanVim' should be pronounced like 'Kina n Vim'.

## Features

1. Full Support for C, C++, Assembly, Python, Markdown, LaTeX, html, dockerfile, cmake, lua and viml, including auto-completion, formatting, highlighting and linting functions. You can even view simple PDF files using poppler and vim-pdf plugin. For C, C++ and Python, there is a complete working flow: coding, compiling, running and debugging.
2. Wonderful file navigation and tag list(powered by telescope, coc-list, coc-explorer, yazi).
3. Integrated with various apps, including yazi, git, lazygit, lazydocker, Ipython and Python.
4. Great multi-language translation.
5. Beautiful appearance.

## Requirements

- terminal with a nerd font and 256-color support.
- Neovim(I am using 0.10 now).
- curl, git, nodejs, yarn, fd, sed
- For Python:
    - python3, black(formatter), ipython, debugpy(debugger), Anaconda or Miniconda >= 4.6
- For C/C++:
    - gcc, g++, clangd(LSP), make, cmake, cmake-format(formatter), cmake-language-server(LSP), codelldb(debugger)
- For LaTeX:
    - texlive, texlab(LSP), latexindent(formatter), zathura on WSL2(not recommended) or SumatraPDF on host Windows located at `/mnt/c/Users/YourUserName/AppData/Local/SumatraPDF/SumatraPDF.exe`(You need to replace your username in `~/.vim/configs/plugins/vimtex.vim)`!!!
- For Assembly:
    - asm-lsp(LSP), asmfmt(formatter)
- For PDF:
    - poppler(poppler-utils) or pdftotext
- For hex:
    - xxd
- For docker:
    - docker, lazydocker(optional)
- For lua:
    - lua-language-server
- fzf, yazi, lazygit(all optional but useful)
- For Neovim users: pynvim(python module), and tree-sitter-cli

## Installation

- Clone the repository.

```bash
git clone https://github.com/KinnariyaMamaTanha/KinanVim ~/.config/nvim
```

- Enter neovim for the first time. `lazy.nvim` will automatically install itself and other plugins. Then `coc.nvim` will install its sub-plugins

```bash
nvim
```

- After install all the plugins, you should:

1. Add `export PATH="$PATH:$HOME/.local/share/nvim/mason/bin` to your `.bashrc` or `.zshrc` or so, then install LSPs, DAPs, etcs with mason.nvim.
2. **Wakatime** setup: If you have a [wakatime](https://wakatime.com/) account, you should also set up wakatime plugin according to [vim-wakatime](https://github.com/wakatime/vim-wakatime).
3. **Copilot** setup: If you have a GitHub copilot account, you should set up [copilot.vim](https://github.com/github/copilot.vim) in Vim or [copilot.lua](https://github.com/zbirenbaum/copilot.lua) in Neovim according to their READMEs.
4. Press hot-key `TD` to see all the configurations you need to modify.
5. Read the configurations to be familiar with its keymaps and functions.

## Plugins

<details>
  <summary><b>Click to see all</b></summary>

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim)
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
- [honza/vim-snippets](https://github.com/honza/vim-snippets)
- [rhysd/clever-f.vim](https://github.com/rhysd/clever-f.vim)
- [wakatime/vim-wakatime](https://github.com/wakatime/vim-wakatime)
- [kkvh/vim-docker-tools](https://github.com/kkvh/vim-docker-tools)
- [hotoo/pangu.vim](https://github.com/hotoo/pangu.vim)
- [lervag/vimtex](https://github.com/lervag/vimtex)
- [makerj/vim-pdf](https://github.com/makerj/vim-pdf)
- [mayanksuman/vim-notes-markdown](https://github.com/mayanksuman/vim-notes-markdown)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [dstein64/vim-startuptime](https://github.com/dstein64/vim-startuptime)
- [lambdalisue/vim-suda](https://github.com/lambdalisue/vim-suda)
- [HiPhish/rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim)
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [Mofiqul/vscode.nvim](https://github.com/Mofiqul/vscode.nvim)
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [folke/twilight.nvim](https://github.com/folke/twilight.nvim)
- [folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim)
- [hedyhli/outline.nvim](https://github.com/hedyhli/outline.nvim)
- [natecraddock/workspaces.nvim](https://github.com/natecraddock/workspaces.nvim)
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [Bekaboo/dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [CRAG666/code_runner.nvim](https://github.com/CRAG666/code_runner.nvim)
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [nvimdev/dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
- [fedepujol/move.nvim](https://github.com/fedepujol/move.nvim)
- [MeanderingProgrammer/markdown.nvim](https://github.com/MeanderingProgrammer/markdown.nvim)
- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio)
- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [mfussenegger/nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)
- [LunarVim/bigfile.nvim](https://github.com/LunarVim/bigfile.nvim)
- [gelguy/wilder.nvim](https://github.com/gelguy/wilder.nvim)
- [FabianWirth/search.nvim](https://github.com/FabianWirth/search.nvim)
- [debugloop/telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)
- [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- [kmontocam/nvim-conda](https://github.com/kmontocam/nvim-conda)
- [RaafatTurki/hex.nvim](https://github.com/RaafatTurki/hex.nvim)
- [potamides/pantran.nvim](https://github.com/potamides/pantran.nvim)
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
- [Eandrju/cellular-automaton.nvim](https://github.com/Eandrju/cellular-automaton.nvim)
- [iqxd/vim-mine-sweeping](https://github.com/iqxd/vim-mine-sweeping)

<details>
  <summary><b>coc.nvim plugins</b></summary>

- [josa42/coc-sh](https://github.com/josa42/coc-sh)
- [neoclide/coc-json](https://github.com/neoclide/coc-json)
- [iamcco/coc-vimlsp](https://github.com/iamcco/coc-vimlsp)
- [fannheyward/coc-pyright](https://github.com/fannheyward/coc-pyright)
- [clangd/coc-clangd](https://github.com/clangd/coc-clangd)
- [fannheyward/coc-markdownlint](https://github.com/fannheyward/coc-markdownlint)
- [neoclide/coc-git](https://github.com/neoclide/coc-git)
- [weirongxu/coc-explorer](https://github.com/weirongxu/coc-explorer)
- [neoclide/coc-snippets](https://github.com/neoclide/coc-snippets)
- [bigshans/coc-word](https://github.com/bigshans/coc-word)
- [neoclide/coc-yank](https://github.com/neoclide/coc-yank)
- [yaegassy/coc-pydocstring](https://github.com/yaegassy/coc-pydocstring)
- [josa42/coc-docker](https://github.com/josa42/coc-docker)
- [fannheyward/coc-ecdict](https://github.com/fannheyward/coc-ecdict)
- [weirongxu/coc-webview](https://github.com/weirongxu/coc-webview)
- [weirongxu/coc-markdown-preview-enhanced](https://github.com/weirongxu/coc-markdown-preview-enhanced)
- [neoclide/coc-html](https://github.com/neoclide/coc-html)
- [fannheyward/coc-texlab](https://github.com/fannheyward/coc-texlab)
- [josa42/coc-lua](https://github.com/josa42/coc-lua)
- [neoclide/coc-pairs](https://github.com/neoclide/coc-pairs)

</details>

</details>

## Future Plans

- [ ] Add support for sql
- [x] Integration with copilot
- [ ] Add support for remote development
- [ ] Better support for makefile, cmake and docker.
  - [ ] makefile
  - [ ] cmake
  - [x] docker
- [ ] Editing and running jupyter notebook inside neovim.
- [x] Support Conda venv (de)activating without leaving neovim.
- [ ] Better user experience

## Screenshots

### Startup UI

<details>
  <summary><b>Startup UI</b></summary>

![neovim](./screenshots/13.png)

</details>

### Fuzzy finder

<details>
  <summary><b>Fuzzy Finder</b></summary>

![Neovim](./screenshots/16.png)

</details>

### ipython integration

<details>
  <summary><b>ipython</b></summary>

![neovim](./screenshots/19.png)

</details>

### Code space

<details>
  <summary><b>code space</b></summary>

![neovim](./screenshots/14.png)

</details>

### Undo history

<details>
  <summary><b>Un Do</b></summary>

![neovim](./screenshots/17.png)

</details>

### [yazi](https://github.com/sxyazi/yazi) integration

<details>
  <summary><b>yazi</b></summary>

![yazi](./screenshots/7.png)

</details>

### Git information integration

<details>
  <summary><b>Git</b></summary>

![vim](./screenshots/8.png)

</details>

### [lazygit](https://github.com/jesseduffield/lazygit) integration

<details>
  <summary><b>lazygit</b></summary>

![lazygit](./screenshots/9.png)

</details>

### Markdown preview

<details>
  <summary><b>Markdown preview</b></summary>

![neovim](./screenshots/12.png)

</details>

### Zen mode

<details>
  <summary><b>Zen Mode</b></summary>

![neovim](./screenshots/18.png)

</details>

### Debugging

<details>
  <summary><b>Debugging</b></summary>

![debug](./screenshots/15.png)

</details>
