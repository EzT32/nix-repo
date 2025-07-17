# ./flake.nix

{
  description = "Unified NixOS + Home Manager flake for ezt";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";

    sharedArgs = {
      inherit system inputs;
    };
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = sharedArgs;
        modules = [
          ./nixos/hosts/laptop/configuration.nix
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = sharedArgs;
        modules = [
          ./nixos/hosts/desktop/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "ezt@laptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };
        modules = [./home-manager/default.nix];
        extraSpecialArgs = {
          inherit system;
          profile = "work";
        };
      };

      "ezt@desktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };
        modules = [./home-manager/default.nix];
        extraSpecialArgs = {
          inherit system;
          profile = "personal";
        };
      };
    };
  };
}

