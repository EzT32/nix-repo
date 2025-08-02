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

  outputs = { nixpkgs, home-manager, nixos-hardware, ... }:
  let
    system = "x86_64-linux";
    
    pkgs = import nixpkgs {
      system = system;
      config = {
        allowUnfree = true;
      };
    };
  in 
  { 
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./hosts/laptop
          ./modules
          nixos-hardware.nixosModules.lenovo-thinkpad-e14-amd
        ];
        specialArgs = { inherit system; };
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./hosts/desktop
          ./modules
        ];
        specialArgs = { inherit system; };
      };
    };


    homeConfigurations = {
      "ezt@laptop" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs; 
        modules = [ ./home-manager ];
        extraSpecialArgs = {
          inherit system;
          profile = "work";
        };
      };

      "ezt@desktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs; 
        modules = [ ./home-manager ];
        extraSpecialArgs = {
          inherit system;
          profile = "personal";
        };
      };
    };
  };
}
