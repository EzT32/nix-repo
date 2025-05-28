{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    sessionVariables = {
      EDITOR = "nvim";
    };
    shellAliases = {
      uio = "ssh final";
    };
  };

  programs.ssh = {
    enable = true;
    # Specify SSH config file content
    extraConfig = ''
      Host final
        HostName login.ifi.uio.no
        User theodobe
        ProxyJump theodobe@login.uio.no

      Host github.com
        User git
        IdentityFile ~/.ssh/id_ed25519_github
        IdentitiesOnly yes
    '';
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      [[ -f ~/.profile ]] && . ~/.profile
    '';
    shellAliases = {
      uio = "ssh final";
    };
  };

  programs.eza.enable = true;
  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"];
  };
}
