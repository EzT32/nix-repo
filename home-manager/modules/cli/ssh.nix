{ ... }:
{
  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "ifi" = {
        hostname = "login.ifi.uio.no";
        user = "theodobe";
        proxyJump = "theodobe@login.uio.no";
        forwardAgent = true;
        identityFile = "~/.ssh/id_rsa_uio";
      };
      "login.uio.no" = {
        user = "theodobe";
        identityFile = "~/.ssh/id_rsa_uio";
      };
    };
  };
}
