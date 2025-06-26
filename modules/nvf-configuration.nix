# TODO: Add better markdown support.

{ pkgs, ... }:

{
  vim = {
    theme = {
      enable = true;
      name = "base16";
      style = "dark";

      base16-colors = {
        # Gruvbox like theme with less colors.
        base00 = "262626"; # ----
        base01 = "3a3a3a"; # ---
        base02 = "4e4e4e"; # --
        base03 = "8a8a8a"; # -
        base04 = "949494"; # +
        base05 = "dab997"; # ++
        base06 = "d1b897"; # +++
        base07 = "ebdbb2"; # ++++
        base08 = "d1b897"; # red
        base09 = "d1b897"; # orange
        base0A = "d1b897"; # yellow
        base0B = "afaf00"; # green
        base0C = "d1b897"; # aqua/cyan
        base0D = "d1b897"; # blue
        base0E = "d485ad"; # purple
        base0F = "d65d0e"; # brown
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
        virtual_text = false;
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
      number = true;
      relativenumber = false;
      # signcolumn = "yes";
      undofile = true;
      shortmess = "I";
      guicursor = "";
    };

    lsp = {
      enable = true;
      formatOnSave = false;
      lspkind.enable = false;
      lspsaga.enable = false;
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
      mappings = {
        openDiagnosticFloat = "<leader>r";
        codeAction = "<leader>ca";
        renameSymbol = "<leader>cr";
        goToDeclaration = "gr";
        goToDefinition = "gd";
        goToType = "gt";
      };

      trouble = {
        enable = true;
        mappings.documentDiagnostics = "<leader>cd";
      };
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
      haskell.enable = true;

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
      { key = "<leader>y"; mode = [ "n" "v" ]; silent = true; action = "\"+y"; }
      { key = "<leader>Y"; mode = [ "n" "v" ]; silent = true; action = "\"+Y"; }
    ];

    lazy.plugins."lean.nvim" = {
      package      = pkgs.vimPlugins.lean-nvim;
      setupModule  = "lean";         # calls require('lean').setup(...)
      setupOpts    = { 
        mappings = false; 
        infoview.autoopen = false;
      };
      event = [
        { event = "BufReadPre"; pattern = "*.lean"; }
        { event = "BufNewFile"; pattern = "*.lean"; }
      ];
    };
  };
}


