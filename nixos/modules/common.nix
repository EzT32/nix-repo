# modules/common.nix

{
  inputs,
  pkgs,
  nixpkgs-unstable,
  ...
}: {
  # Hyperland
  programs.hyprland.enable = true;

  # GDM
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  programs.adb.enable = true;
  virtualisation.libvirtd.enable = true;

  services.dnsmasq.enable = true;
  services.dnsmasq.settings = {
    server = ["8.8.8.8" "1.1.1.1"];
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
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.channel.enable = false;
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.GDK_SCALE = "1.5";
  environment.sessionVariables.QT_SCALE_FACTOR = "1.5";

  # Allow 'unfree' packages in search (Like proprietary GPU drivers etc).
  nixpkgs.config.allowUnfree = true;

  # Use systemd as bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound and bluetooth.
  security.rtkit.enable = true;
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
    extraGroups = ["wheel" "networkmanager" "video" ];
  };

  #services.udev.extraRules = ''
  #  # Allow full access to the Razer BlackShark V2 Pro
  #  SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0555", MODE="0666", TAG+="uaccess"
  #
  #  # Optional: ensure input event nodes are treated as key devices
  #  SUBSYSTEM=="input", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0555", ENV{ID_INPUT_KEY}="1"
  #'';

  environment.systemPackages = with pkgs; [
    vim
    wget
    zip
    unzip
    bluez
    blueman
    brightnessctl
    playerctl
    libinput
    evtest
  ];

  #boot.kernelParams = [
  #  "usbhid.quirks=0x1532:0x0555:0x0004"
  #];

  services.udisks2.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent.enable = true;

  services.openssh.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [22 5555];
}
