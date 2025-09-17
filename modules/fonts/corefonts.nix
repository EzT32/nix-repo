{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      corefonts
    ];
  };
}
