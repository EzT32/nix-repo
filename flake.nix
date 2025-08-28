{
  description = "Root flake for repository";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixos-hardware,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      # Remember to update to 'nixfmt' after transition fase.
      formatter.${system} = pkgs.nixfmt-tree;

      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          # inherit system;
          modules = [
            ./hosts/laptop
            ./modules
            nixos-hardware.nixosModules.lenovo-thinkpad-e14-amd
          ];
          specialArgs = { inherit system unstable; };
        };

        desktop = nixpkgs.lib.nixosSystem {
          # inherit system;
          modules = [
            ./hosts/desktop
            ./modules
          ];
          specialArgs = { inherit system unstable; };
        };
      };

      homeConfigurations = {
        "ezt@laptop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home-manager ];
          extraSpecialArgs = {
            inherit system unstable;
            profile = "work";
          };
        };

        "ezt@desktop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home-manager ];
          extraSpecialArgs = {
            inherit system unstable;
            profile = "personal";
          };
        };
      };
    };
}
