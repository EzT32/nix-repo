{ config, inputs, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-e14-amd
    ];

  # Hyperland
  programs.hyprland.enable = true;

  # GDM
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
  
  # Portals
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    # Use xdg portals in lexographic priority
    config.common.default = "*";
  };

  # Keyring to remember passwords
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm-password.enableGnomeKeyring = true;

  # Experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.channel.enable = false;
  nix.settings.auto-optimise-store = true;
  #documentation.nixos.enable = false;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.GDK_SCALE = "1.5";
  environment.sessionVariables.QT_SCALE_FACTOR = "2";
  
  # Allow 'unfree' packages in search (Like proprietary GPU drivers etc).
  nixpkgs.config.allowUnfree = true;  

  # Use systemd as bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ezt"; 
  networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = true;

  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "no";
  };
  
  # Keyboard layout for GDM
  services.xserver.xkb.layout = "no";
  
  # Touchpad settings
  #services.libinput.enable = true;
  #services.libinput.touchpad.naturalScrolling = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound and bluetooth.
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  hardware.bluetooth.enable = true;



  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ezt = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager"];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    zip
    unzip
    bluez
    blueman
    brightnessctl
   ];

#  boot.kernelModules = [
 #   "thinkpad-acpi"
  #];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
