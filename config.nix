{ pkgs, ... }:

{
  initLua = ''
    vim.loader.enable()
    require('user')
  '';

  # binaries that may be required to run config and aren't vim plugins
  extraBinPath = with pkgs; [
    # tools
    ripgrep
    fzf
    nodejs
    iproute2

    # LSP
    nixd
    bash-language-server
    lua-language-server
    vscode-langservers-extracted
    texlab
    pyright
    clang-tools

    # Linters
    eslint
    eslint_d
    markdownlint-cli2

    # Formatters
    stylua
    nixfmt
    prettier
    prettierd
    tex-fmt
  ];

  plugins = {
    start = with pkgs.vimPlugins; [
      lz-n
      catppuccin-nvim

      # picker
      snacks-nvim
      plenary-nvim

      nvim-treesitter
      (nvim-treesitter.withPlugins (
        p: with p; [
          tree-sitter-bash
          tree-sitter-c
          tree-sitter-cpp
          tree-sitter-dockerfile
          tree-sitter-go
          tree-sitter-gomod
          tree-sitter-html
          tree-sitter-json
          tree-sitter-lua
          tree-sitter-markdown
          tree-sitter-markdown-inline
          tree-sitter-nix
          tree-sitter-php
          tree-sitter-python
          tree-sitter-todotxt
          tree-sitter-yaml
          tree-sitter-zig
        ]
      ))

      mini-nvim
    ];

    opt = with pkgs.vimPlugins; [
      nvim-autopairs

      # completion
      blink-pairs
      # blink-ripgrep-nvim
      blink-cmp
      luasnip

      # debug
      # dap
      # dap-ui

      gitsigns-nvim

      # fmt, lint, lsp
      conform-nvim
      nvim-lint
      fidget-nvim
      nvim-lspconfig

      which-key-nvim
    ];

    optAttrs = {
      "blink-ripgrep" = pkgs.vimPlugins.blink-ripgrep-nvim;
      "mySnippets" = pkgs.vimUtils.buildVimPlugin {
        pname = "mySnippets";
        version = "unstable";
        src = pkgs.fetchFromGitHub {
          owner = "sunjukebox";
          repo = "mysnippets";
          rev = "397a4f3f7c24a7bcf537af1bfe554841bbdf01f1";
          hash = "sha256-lOqsS8m+OLuHNnQ9gAa1F3K6ncfArkzXKf4p7Zfn3Gw=";
        };
        nvimSkipModules = [
          "mySnippets.context"
          "mySnippets.latex"
          "mySnippets.position"
        ];
      };
      "todo-comments" = pkgs.vimPlugins.todo-comments-nvim;
    };

    # Finally, here we define our devMode.
    dev.myconfig = {
      pure = ./.;
      impure = "/home/$(whoami)/src/nvim";
    };
  };
}
