{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    globals.mapleader = " ";

    colorschemes.kanagawa = {
      enable = true;
      settings = {
        theme = "dragon";

        background = {
          dark = "dragon";
          light = "lotus";
        };
        overrides = ''
          function(colors)
            local theme = colors.theme
            return {
              Pmenu = { fg = theme.ui.shade0, bg = "NONE" },
              
              PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
              
              FloatBorder = { fg = theme.ui.shade0, bg = "NONE" },
              
              NormalFloat = { bg = "NONE" },
            }
          end
        '';
      };
    };

    colorscheme = "kanagawa";

    opts = {
      wrap = false;
      clipboard = "unnamedplus";
      termguicolors = true;
      completeopt = "menuone,noselect";
      updatetime = 300;

      #tab settings
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
      shiftround = true;
      smartindent = true;

      #line numbers
      number = true;
      relativenumber = true;
      cursorline = true;
      signcolumn = "yes";

      #search
      ignorecase = true;
      smartcase = true;
      incsearch = true;
      hlsearch = true;

      #swap
      swapfile = false;
      backup = false;
      writebackup = false;
      undofile = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>w";
        action = ":w<CR>";
        options.silent = false;
      }
      {
        mode = "n";
        key = "<leader>q";
        action = ":q<CR>";
        options.silent = false;
      }
      #telescope
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        options.silent = false;
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
        options.silent = false;
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<CR>";
        options.silent = false;
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<CR>";
        options.silent = false;
      }
      {
        mode = "n";
        key = "<leader>lp";
        action = "<cmd>lua require('gitsigns').preview_hunk()<CR>";
        options.silent = false;
      }
      {
        mode = "n";
        key = "<leader>lg";
        action = "<cmd>LazyGit<CR>";
        options.silent = false;
      }

    ];

    autoCmd = [
      {
        event = [ "BufWritePost" "BufEnter" "InsertLeave" ];
        callback = {
          __raw = ''
            function()
              require('lint').try_lint()
            end
          '';
        };
      }
    ];

    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;

          ensure_installed = [
            "bash"
            "c"
            "cpp"
            "css"
            "html"
            "javascript"
            "json"
            "lua"
            "markdown"
            "nix"
            "python"
            "rust"
            "toml"
            "yaml"
          ];
        };
      };

      nvim-autopairs = {
        enable = true;
        settings = {
          check_ts = true;
        };
      };

      plugins.direnv.enable = true;
      luasnip.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-e>" = "cmp.mapping.close()";

            "<CR>" = "cmp.mapping.confirm({ select = true })";

            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
          };
          window = {
            completion.border = "rounded";
            documentation.border = "rounded";
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
          formatters_by_ft = {
            nix = [ "nixpkgs_fmt" ];
            python = [ "isort" "black" ];
            rust = [ "rustfmt" ];
            c = [ "clang_format" ];
            "_" = [ "trim_whitespace" ];
          };
        };
      };

      lint = {
        enable = true;
        lintersByFt = {
          nix = [ "statix" ];
          c = [ "cpplint" ];
          python = [ "pylint" ];
        };
      };

      gitsigns = {
        enable = true;
        settings = {
          attach_to_untracked = true;
          current_line_blame = true;
          current_line_blame_opts = {
            delay = 0;
            virt_text_pos = "eol";
          };
        };
      };

      lazygit = {
        enable = true;
        settings = {
          floating_window_winblend = 0;
          floating_window_scaling_factor = 0.9;
        };
      };

      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "kanagawa";
            icons_enabled = true;
            section_separators = { left = ""; right = ""; };
            component_separators = { left = ""; right = ""; };
          };
        };
      };

      lsp = {
        enable = true;
        servers = {
          lua_ls.enable = true;
          nixd.enable = true;
          clangd.enable = true;
          qmlls = {
            enable = true;
          };
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };

      web-devicons = {
        enable = true;
      };

      telescope = {
        enable = true;
        extensions."fzf-native" = {
          enable = true;
          settings = {
            fuzzy = true;
            override_file_sorter = true;
            override_generic_sorter = true;
            case_mode = "smart_case";
          };
        };
      };
    };
  };
}

