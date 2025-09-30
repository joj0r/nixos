{ config, lib, pkgs, ... }:
{

  services = {

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.forge # Tiling WM
    gnomeExtensions.appindicator # App tray
    gnomeExtensions.just-perfection
  ];
  services.udev.packages = [ pkgs.gnome-settings-daemon ];

  # Set dark theme for QT applications as well
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  programs.dconf.profiles.user.databases = [
    {
      lockAll = true; # prevents overriding
      settings = {
        "org/gnome/desktop/interface" = {
          accent-color = "blue";
          color-scheme = "prefer-dark";
          enable-hot-corners = false;
        };
        "org/gnome/desktop/input-sources" = {
          xkb-options = [ "caps:super" ];
        };
        "org/gnome/desktop/wm/preferences" = {
          num-workspaces = lib.gvariant.mkInt32(4);
        };
        "org/gnome/mutter" = {
          edge-tiling = false;
          dynamic-workspaces = false;
        };
        "org/gnome/desktop/notifications" = {
          show-in-lock-screen = false;
        };
        "org/gnome/desktop/peripherals/mouse" = {
          natural-scroll = false;
        };
        "org/gnome/desktop/peripherals/touchpad" = {
          natural-scroll = false;
        };

        # Keybindings
        "org/gnome/shell/extensions/forge/keybindings" = {
          window-swap-last-active = ["disabled"];
          prefs-tiling-toggle = ["disabled"];
          window-toggle-float = ["<Super>v"];
        };

        "org/gnome/desktop/wm/keybindings" = {
          close = ["<Super>w"];
          minimize = ["disabled"];
          move-to-monitor-down = ["disabled"];
          move-to-monitor-left = ["disabled"];
          move-to-monitor-right = ["disabled"];
          move-to-monitor-up = ["disabled"];
          move-to-workspace-1 = ["<Shift><Super>1"];
          move-to-workspace-2 = ["<Shift><Super>2"];
          move-to-workspace-3 = ["<Shift><Super>3"];
          move-to-workspace-4 = ["<Shift><Super>4"];
          move-to-workspace-down = ["disabled"];
          move-to-workspace-up = ["disabled"];
          switch-to-workspace-left = ["<Super>Left"];
          switch-to-workspace-right = ["<Super>Right"];
          switch-to-workspace-1 = ["<Super>1"];
          switch-to-workspace-2 = ["<Super>2"];
          switch-to-workspace-3 = ["<Super>3"];
          switch-to-workspace-4 = ["<Super>4"];
        };

        "org/gnome/settings-daemon/plugins/media-keys" = {
          screensaver = ["<Super>Esc"];
          custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" 
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" 
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" 
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" 
          ];
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding = "<Super>Return";
          command = "kitty";
          name = "Kitty terminal";
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
          binding = "<Super>z";
          command = "gnome-system-monitor";
          name = "System Monitor";
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
          binding = "<Super>e";
          command = "nautilus";
          name = "Nautilus on super-e";
        };

      };
    }
  ];

}

