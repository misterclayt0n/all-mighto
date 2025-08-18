{ lib, pkgs, ... }: {
  programs.niri.enable = lib.mkDefault true;

  home-manager.sharedModules = [{
    xdg.configFile."niri/config.kdl".text = ''
      input {
          keyboard {
              xkb {
                  layout "us,ru"
                  variant "intl"
              }

              repeat-delay 300
              repeat-rate 50

              numlock
          }

          touchpad {
              tap
              natural-scroll
              // accel-speed 0.2
              // accel-profile "flat"
              // scroll-method "two-finger"
              // disabled-on-external-mouse
          }

          mouse {
              // off
              // natural-scroll
              // accel-speed 0.2
              // accel-profile "flat"
              // scroll-method "no-scroll"
          }

          trackpoint {
              // off
              // natural-scroll
              // accel-speed 0.2
              // accel-profile "flat"
              // scroll-method "on-button-down"
              // scroll-button 273
              // middle-emulation
          }

          // Uncomment this to make the mouse warp to the center of newly focused windows.
          // warp-mouse-to-focus

          // Focus windows and outputs automatically when moving the mouse into them.
          // Setting max-scroll-amount="0%" makes it work only on windows already fully on screen.
          // focus-follows-mouse max-scroll-amount="0%"
      }

      // You can configure outputs by their name, which you can find
      // by running `niri msg outputs` while inside a niri instance.
      // The built-in laptop monitor is usually called "eDP-1".
      // Find more information on the wiki:
      // https://github.com/YaLTeR/niri/wiki/Configuration:-Outputs
      // Remember to uncomment the node by removing "/-"!
      /output "eDP-1" {
          // off
          mode "1920x1080@120.030"
          scale 2
          transform "normal"
          position x=1280 y=0
      }

      output "HDMI-A-1" {
          mode "1920x1080@180.003"
      }

      // Settings that influence how windows are positioned and sized.
      // https://github.com/YaLTeR/niri/wiki/Configuration:-Layout
      layout {
          gaps 16
          background-color "transparent"

          center-focused-column "never"

          preset-column-widths {
              proportion 0.33333
              proportion 0.5
              proportion 0.66667
          }

          default-column-width { proportion 0.5; }

          focus-ring {
              width 1
              active-color "#7fc8ff"
              inactive-color "#505050"
          }

          border {
              off
              width 4
              active-color "#ffc87f"
              inactive-color "#505050"
              urgent-color "#9b0000"
          }

          shadow {
              // on
              softness 30
              spread 5
              offset x=0 y=5
              color "#0007"
          }

          struts { }
      }

      // Startup
      // spawn-at-startup "waybar"
      spawn-at-startup "mako"
      spawn-at-startup "swww-daemon"
      spawn-at-startup "quickshell"

      // prefer-no-csd

      screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
      // screenshot-path null

      animations {
          // off
          // slowdown 3.0
      }

      // Window rules
      window-rule {
          match app-id=r#"^org\.wezfurlong\.wezterm$"#
          default-column-width {}
      }

      window-rule {
          match app-id=r#"firefox$"# title="^Picture-in-Picture$"
          open-floating true
      }

      // Quickshell's rice stuff.
      window-rule {
          geometry-corner-radius 20
          clip-to-geometry true
      }

      layer-rule {
          match namespace="^swww-daemon$"
          place-within-backdrop true
      }

      layer-rule { match namespace="^quickshell-wallpaper$" }
      layer-rule {
          match namespace="^quickshell-overview$"
          place-within-backdrop true
      }

      binds {
          Mod+Shift+Slash { show-hotkey-overlay; }

          Mod+Return hotkey-overlay-title="Open a Terminal: ghostty" { spawn "ghostty"; }
          Mod+D hotkey-overlay-title="App Launcher" { spawn "qs" "ipc" "call" "appLauncher" "toggle"; }
          Super+Alt+L hotkey-overlay-title="Lock the Screen" { spawn "qs" "ipc" "call" "lockScreen" "toggle"; }
          Super+Alt+H hotkey-overlay-title="Notifications" { spawn "qs" "ipc" "call" "notifications" "toggleHistory"; }
          XF86MonBrightnessUp   hotkey-overlay-title="Increase Brightness" { spawn "qs" "ipc" "call" "brightness" "increase"; }
          XF86MonBrightnessDown hotkey-overlay-title="Decrease Brightness" { spawn "qs" "ipc" "call" "brightness" "decrease"; }

          XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"; }
          XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"; }
          XF86AudioMute        allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
          XF86AudioMicMute     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }

          Mod+O repeat=false { toggle-overview; }

          Mod+Q { close-window; }

          Mod+Left  { focus-column-left; }
          Mod+Down  { focus-window-down; }
          Mod+Up    { focus-window-up; }
          Mod+Right { focus-column-right; }
          Mod+H     { focus-column-left; }
          Mod+J     { focus-window-down; }
          Mod+K     { focus-window-up; }
          Mod+L     { focus-column-right; }

          Mod+Ctrl+Left  { move-column-left; }
          Mod+Ctrl+Down  { move-window-down; }
          Mod+Ctrl+Up    { move-window-up; }
          Mod+Ctrl+Right { move-column-right; }
          Mod+Ctrl+H     { move-column-left; }
          Mod+Ctrl+J     { move-window-down; }
          Mod+Ctrl+K     { move-window-up; }
          Mod+Ctrl+L     { move-column-right; }

          Mod+Home { focus-column-first; }
          Mod+End  { focus-column-last; }
          Mod+Ctrl+Home { move-column-to-first; }
          Mod+Ctrl+End  { move-column-to-last; }

          Mod+Shift+Left  { focus-monitor-left; }
          Mod+Shift+Down  { focus-monitor-down; }
          Mod+Shift+Up    { focus-monitor-up; }
          Mod+Shift+Right { focus-monitor-right; }
          Mod+Shift+H     { focus-monitor-left; }
          Mod+Shift+J     { focus-monitor-down; }
          Mod+Shift+K     { focus-monitor-up; }
          Mod+Shift+L     { focus-monitor-right; }

          Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
          Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
          Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
          Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
          Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
          Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
          Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
          Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

          Mod+Page_Down      { focus-workspace-down; }
          Mod+Page_Up        { focus-workspace-up; }
          Mod+U              { focus-workspace-down; }
          Mod+I              { focus-workspace-up; }
          Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
          Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }
          Mod+Ctrl+U         { move-column-to-workspace-down; }
          Mod+Ctrl+I         { move-column-to-workspace-up; }

          Mod+Shift+Page_Down { move-workspace-down; }
          Mod+Shift+Page_Up   { move-workspace-up; }
          Mod+Shift+U         { move-workspace-down; }
          Mod+Shift+I         { move-workspace-up; }

          Mod+Minus { set-column-width "-10%"; }
          Mod+Equal { set-column-width "+10%"; }

          Mod+Shift+Minus { set-window-height "-10%"; }
          Mod+Shift+Equal { set-window-height "+10%"; }

          Mod+V       { toggle-window-floating; }
          Mod+Shift+V { switch-focus-between-floating-and-tiling; }

          Mod+W { toggle-column-tabbed-display; }

          Print      { screenshot; }
          Ctrl+Print { screenshot-screen; }
          Alt+Print  { screenshot-window; }

          Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }

          Mod+Shift+E    { quit; }
          Ctrl+Alt+Delete { quit; }

          Mod+Shift+P { power-off-monitors; }
      }
    '';
  }];
}

