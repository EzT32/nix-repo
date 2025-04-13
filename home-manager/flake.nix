{
  description = "Home Manager configuration of ezt";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs_unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
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
  in {
    # Home Manager configuration
    homeConfigurations = {
      work = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home/work.nix];
          extraSpecialArgs = {
            inherit inputs pkgs_unstable;
            profile = "work";
          };
      };
      personal = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home/personal.nix];
          extraSpecialArgs = {
            inherit inputs pkgs_unstable;
            profile = "personal";
          };
      };
    };
  };
}
