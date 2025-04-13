{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs_unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs_unstable,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs_unstable = import nixpkgs_unstable {
      inherit system;
    };
  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs system pkgs_unstable;};

        modules = [
          ./hosts/laptop/configuration.nix
        ];
      };
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs system pkgs_unstable;};

        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };
    };
  };
}
