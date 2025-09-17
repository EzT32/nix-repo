{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.pdf
  ];
}
