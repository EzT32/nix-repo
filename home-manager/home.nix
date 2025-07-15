# home-manager/home.nix

{profile, ...}:
{
  imports = [
    ./profiles/${profile}/home.nix
  ];
}
