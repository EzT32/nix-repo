{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };

  in
  {
    # This flake defines a single NixOS config named "default" for simplicity, as it's implied in the rebuild-command.
    # For multiple configurations, modify to the following:
    # nixosConfigurations = {
    #   <keyname> = nixpkgs.lib.nixosSystem {
    #     specialArgs { inherit inputs; };
    #     
    #     modules = [
    #       ./nixos/configuration.nix
    #       <other modules>
    #     ];
    #   };
    # }:  
    nixosConfigurations."ezt" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs system; };
	
      modules = [
	./configuration.nix
      ];
    };
  };
}
