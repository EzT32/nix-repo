{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wlr-randr
  ];
}
