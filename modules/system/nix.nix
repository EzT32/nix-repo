_: {
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.maxGenerations = 5;
  nix.maxUserProfileGenerations = 5;

  nix.channel.enable = false;
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
}
