{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "EzT32";
    userEmail = "theodor.berghansen@icloud.com";

    #includes = [
    # {path = "~/.config/git/git-uio.nix";}
    #  {path = "~/.config/git/git-personal.nix";}
    #];

    package = pkgs.gitFull;
    extraConfig = {
      credential.helper = "libsecret";
    };
  };
}
