{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ezt";
  home.homeDirectory = "/home/ezt";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Wayland
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      input.kb_layout = "no";
      bind = ["SUPER,Q,exec,kitty"];
    };
  };
  
  # Enable git
  programs.git = {
    enable = true;
    userName = "EzT32";
    userEmail = "theodor.berghansen@icloud.com";
    package = pkgs.gitFull;
    extraConfig.credential.helper = "libsecret";
  };

  # Waybar
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  # Zsh
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    #envExtra = ''
    #  export SOMEZSHVARIABLE="SOMETHING"
    #''
  };

  # Kitty
  programs.kitty = {
    enable = true;
    settings.linux_display_server = "wayland";
  };

  # Rofi-wayland
  # programs.rofi-wayland (IDK HVA FAEN DEN HETER)
  
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {};

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ezt/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
