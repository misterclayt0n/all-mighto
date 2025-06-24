# TODO: Add better markdown support.

{ ... }:

{
  vim = {
    theme = {
      enable = true;
      name = "base16";
      style = "dark";

      base16-colors = {
        # Gruvbox like theme with less colors.
        base00 = "262626"; 
        base01 = "3a3a3a"; 
        base02 = "4e4e4e"; 
        base03 = "8a8a8a"; 
        base04 = "949494"; 
        base05 = "dab997"; 
        base06 = "d1b897"; 
        base07 = "ebdbb2"; 
        base08 = "d1b897"; 
        base09 = "d1b897"; 
        base0A = "d1b897"; 
        base0B = "d1b897"; 
        base0C = "85ad85"; 
        base0D = "83adad"; 
        base0E = "d485ad"; 
        base0F = "d65d0e"; 
      };
    };

    vimAlias = true; # To make "vim" open nvf instead of regular vim.
    mini.statusline.enable = true;
    comments.comment-nvim.enable = true;
    filetree.neo-tree.enable = true;

    telescope = {
      enable = true;
      mappings = {
        buffers = "<leader>bb";
        diagnostics = "<leader>D";
        findFiles = "<leader><leader>";
        liveGrep = "<leader>/";
      };
    };

    notes.todo-comments = {
      enable = true;
      mappings.telescope = "<leader>tt";
    };

    diagnostics = {
      enable = true;
      config = {
        virtual_text = true;
      };
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    autocomplete.blink-cmp = {
      enable = true;
      mappings = {
        confirm = "<CR>";
        next = "<C-n>";
        previous = "<C-p>";
        scrollDocsDown = "<C-j>";
        scrollDocsUp = "<C-k>";
      };
    };

    visuals = {
      nvim-web-devicons.enable = true;
      fidget-nvim.enable = true;
    };

    options = {
      tabstop = 2;
      shiftwidth = 2; # 2 spaces is the only correct indentation.
      scrolloff = 4;

      # Juniors are the only ones who need line numbers btw.
      number = false;
      relativenumber = false;
      signcolumn = "no";
      undofile = true;
      shortmess = "I";
    };

    lsp = {
      enable = true;
      formatOnSave = false;
      lspkind.enable = false;
      lspsaga.enable = false;
      trouble.enable = true;
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
      mappings.format = "<leader>fm";
    };

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false;
    };

    utility = {
      surround = {
        enable = true;
        setupOpts.keymaps.visual = "S";
      };
      multicursors.enable = false;
      yanky-nvim = {
        enable = true;
        setupOpts = {
          ring.storage = "sqlite";
          highlight = {
            timer = 100;
          };
        };
      };
      oil-nvim = {
        enable = true;
        setupOpts = {
          columns = [
            "icon"
            "permissions"
            "size"
            "mtime"
          ];
          view_options.show_hidden = true;
        };
      };
    };

    languages = {
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      #
      # The goats.
      #

      nix = {
        enable = true;
        extraDiagnostics.enable = true;
      };
      rust = {
        enable = true;
        crates.enable = true;
        dap.enable = true;
      };
      nu.enable = true;

      #
      # The rest.
      #

      # NOTE: I do have a lot of langs here and this is probably just taking a lot of space.

      ts.enable = true;
      python.enable = true;
      tailwind.enable = true;
      css.enable = true;
      html.enable = true;
      clang.enable = true;
      odin.enable = true;
      zig.enable = true;
      lua.enable = true;
      go = {
        enable = true;
        dap.enable = true;
      };
    };

    #
    # Keymaps.
    #

    keymaps = [
      { key = "<leader>ff"; mode = "n"; silent = true; action = ":Oil<CR>"; }
      { key = "<leader>e"; mode = "n"; silent = true; action = ":Neotree toggle<CR>"; }
      { key = ">"; mode = "n"; silent = true; action = ">gv"; }
      { key = "<"; mode = "n"; silent = true; action = "<gv"; }
      { key = "U"; mode = "n"; silent = true; action = ":redo<CR>"; }
      { key = "<C-w>|"; mode = "n"; silent = true; action = ":vsplit<CR>"; }
      { key = "<C-w>-"; mode = "n"; silent = true; action = ":split<CR>"; }
      { key = "<C-w>d"; mode = "n"; silent = true; action = ":close<CR>"; }
      { key = "<C-w>p"; mode = "n"; silent = true; action = ":bprev<CR>"; }
      { key = "<C-w>n"; mode = "n"; silent = true; action = ":bnext<CR>"; }
      { key = "<leader>bd"; mode = "n"; silent = true; action = ":bdelete<CR>"; }
      { key = "<leader>y"; mode = ["n" "v"]; silent = true; action = "\"+y"; }
      { key = "<leader>Y"; mode = ["n" "v"]; silent = true; action = "\"+Y"; }
    ];
  };
}

