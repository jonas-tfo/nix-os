{ pkgs, ... }:
{
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  virtualisation.docker.enable = true;

  services.power-profiles-daemon.enable = false;
  services.tlp.enable = true;

  services.openssh.enable = true;


  # mariadb at boot
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}
