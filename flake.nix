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

  outputs =
    {
      nixpkgs,
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
    in
    {
      # Remember to update to 'nixfmt' after transition fase.
      formatter.${system} = pkgs.nixfmt-tree;

      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/laptop
            ./modules
            nixos-hardware.nixosModules.lenovo-thinkpad-e14-amd
          ];
          specialArgs = { inherit system; };
        };

        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/desktop
            ./modules
          ];
          specialArgs = { inherit system; };
        };
      };

      homeConfigurations = {
        "ezt@laptop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home-manager ];
          extraSpecialArgs = {
            inherit system;
            profile = "work";
          };
        };

        "ezt@desktop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home-manager ];
          extraSpecialArgs = {
            inherit system;
            profile = "personal";
          };
        };
      };
    };
}
