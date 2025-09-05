{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    zip
    unzip
    libinput
    evtest
  ];
}
