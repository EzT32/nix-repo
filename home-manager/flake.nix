{
  description = "Home Manager configuration of ezt";

  inputs = {
    # Use the latest unstable Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";  # Adjust this if using another architecture

      # Apply an overlay to customize android-studio
      overlays = [
        (final: prev: {
          android-studio = prev.android-studio.override {
            forceWayland = false;
          };
        })
      ];

      # Import nixpkgs with overlays applied
      pkgs = import nixpkgs {
        inherit system;
        overlays = overlays;
      };

    in {
      homeConfigurations."ezt" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Include your home.nix configuration
        modules = [ ./home.nix ];

        # Optionally pass additional arguments
        extraSpecialArgs = {
          inherit inputs;
        };
      };
    };
}

