{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    curl
    evtest
    htop
    jq
    libinput
    lsof
    parted
    pwvucontrol
    strace
    unzip
    vim
    wget
    zip
  ];
}
