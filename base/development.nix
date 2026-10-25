{ pkgs, ... }:
{
    hm.home.packages = with pkgs; [
        gcc gnumake cmake clang-tools glib
        tree-sitter lldb lua cargo rustc
        glib

        fd fzf git glab github-cli gh
        zip unzip curl
    ];

    hm.programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        defaultEditor = true;
        plugins = with pkgs.vimPlugins; [ nvim-lspconfig ];

        extraPackages = with pkgs; [
            clang-tools lua-language-server
            rust-analyzer typescript-language-server
            vscode-langservers-extracted
        ];

        initLua = ''
            require('vim._core.ui2').enable({})
            
            require("options")
            require("pack")
            require("autocmds")
            require("keymaps")
            require("lsp")
            
            vim.cmd.colorscheme("echidna")
            
            require("plugins.lualine")
            require("plugins.fzf")
            require("plugins.snacks")
            require("plugins.multicursors")
            require("plugins.ibl")
        '';
    };
}
