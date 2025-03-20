{
  description = "Home Manager configuration of ezt";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs_stable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs_stable,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      };
      pkgs_stable = import nixpkgs_stable {
        inherit system;
        config.allowUnfree = true;
      };
  in {
    # Home Manager configuration
    homeConfigurations."ezt" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [./home.nix];
      extraSpecialArgs = {inherit inputs pkgs_stable;};
    };
  };
}
