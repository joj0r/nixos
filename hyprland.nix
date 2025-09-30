{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    # For login screen
    # cage
    # regreet

    # Pkgs for Hyprland
    waybar
    xfce.thunar # File manager
    wofi # Ctrl - R

    # For audio control
    pamixer
    playerctl

    # For controlling brightness
    brightnessctl

    # For Nextcloud autologin and storing NC password
    kdePackages.kwallet
    kdePackages.kwallet-pam
    kdePackages.kwalletmanager

  ];

  # For adding neccessary lines to /etc/pam.d for auto open
  # kde wallet on login
  security.pam.services.greetd.kwallet = {
    enable = true;
    forceRun = true;
  };
  security.pam.services.hyprlock = {};

  # Greetd for loging in
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "cage -s -- regreet";
  #       user = "greeter";
  #     };
  #   };
  # };
  # # ReGreet as login manager. 
  # programs.regreet = {
  #   enable = true;
  #   settings = {
  #     GTK = {
  #       application_prefer_dark_theme = true;
  #     };
  #   };
  # };
}
