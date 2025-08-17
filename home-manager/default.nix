# home-manager/default.nix

{ profile, ... }:
{
  /*
    Note: Importing './modules' after profiles might not evaluate.
    When changing order, one should also assure that userspace modules are loaded
  */
  imports = [
    ./modules
    (import ./profiles { inherit profile; })
  ];
}
