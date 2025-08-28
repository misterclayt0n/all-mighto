{ pkgs, ... }:
{
  home-manager.sharedModules = [{
    programs.helix = {
      enable = true;

      themes.gruvbox =
        builtins.fromTOML (builtins.readFile ./themes/gruvbox.toml);

      settings = {
        theme = "iceberg-light";

        editor = {
          shell = [ "nu" "-c" ];
          file-picker.hidden = false;
        };

        keys = {
          insert.esc = [ "move_char_left" "normal_mode" ];

          normal."space".i = {
            a   = [ ":insert-output echo 'α'" ];
            b   = [ ":insert-output echo 'β'" ];
            y   = [ ":insert-output echo 'γ'" ];
            "[" = [ ":insert-output echo '⟨'" ];
            "]" = [ ":insert-output echo '⟩'" ];
            "." = [ ":insert-output echo '·'" ];
            x   = [ ":insert-output echo '×'" ];
            v   = [ ":insert-output echo '∧'" ];
          };
        };
      };

      languages = {
        language = [
          { name = "rust"; auto-format = false; formatter = { command = "rustfmt"; }; }
          { name = "zig";  auto-format = false; }
          { name = "go";   auto-format = false; }
          { name = "c";    auto-format = false; }
          { name = "lean"; scope = "source.lean"; file-types = [ "lean" ]; auto-format = false; }
          { name = "odin"; auto-format = false; }
        ];

        language-server.lean = {
          command = "lean";
          args    = [ "--server" ];
        };
      };
    };

    home.packages = with pkgs; [
      deno
      nixd
      gopls
      lua-language-server
      zls
      basedpyright
      lean4
    ];
  }];
}

