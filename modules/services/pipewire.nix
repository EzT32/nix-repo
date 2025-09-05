{ ... }:
{
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    audio.enable = true;
    pulse.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
  
  environment.etc."wireplumber/main.lua.d/51-razer.lua".text = ''
    rule = {
      matches = {
        {
          { "device.name", "matches", "alsa_card.usb-Razer_Razer_BlackShark_V2_Pro*" },
        },
      },
      apply_properties = {
        ["device.profile"] = "output:iec958-stereo+input:mono-fallback",
      },
    }

    table.insert(alsa_monitor.rules, rule)
  '';
}
