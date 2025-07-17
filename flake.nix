# ./flake.nix
{
  description = "Unified NixOS + Home Manager flake for ezt";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs_unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs_unstable,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs_unstable = import nixpkgs_unstable {
      inherit system;
      config.allowUnfree = true;
    };

    sharedArgs = {
      inherit inputs pkgs pkgs_unstable system;
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
        inherit pkgs;
        modules = [
          (import ./home-manager/default.nix)
        ];
        extraSpecialArgs = sharedArgs // {profile = "work";};
      };

      "ezt@desktop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          (import ./home-manager/default.nix)
        ];
        extraSpecialArgs = sharedArgs // {profile = "personal";};
      };
    };
  };
}
