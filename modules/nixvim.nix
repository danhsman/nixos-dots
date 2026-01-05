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


    plugins = {
      
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

