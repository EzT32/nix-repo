{...}:
{
  security = {
    rtkit.enable = true;
    pam.services.gdm-password.enableGnomeKeyring = true;
  };

  programs.gnupg.agent.enable = true;
}
