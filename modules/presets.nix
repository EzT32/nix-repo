_:
{
  custom = {
    kitty.enable = true;
    rofi.enable = true;
    nvim.enable = true;
    git = {
      enable = true;

      userName = "EzT32";
      userEmail = "theodor.berghansen@icloud.com";
    };

    shell = {
      bash.enable = true;
      eza.enable = true;
      zoxide.enable = true;
      zsh.enable = true;
    };

    programs.firefox.enable = true;
    nixpkgs.config.allowUnfree = true;
  };
}
