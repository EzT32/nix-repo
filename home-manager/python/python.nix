{pkgs, ...}: {
  home.packages = with pkgs; [
    python311
    pandoc
    texliveFull
  ];
}
