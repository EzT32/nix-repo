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

      # local -> server
      # scp /path/to/local/file final:/path/to/remote/destination
      # server -> local
      # scp final:/path/to/remote/file /path/to/local/destination
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
