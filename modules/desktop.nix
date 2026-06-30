{ pkgs, lib, ... }:
{
  programs.niri.enable = true;

  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
  };

  # DMS service is WantedBy=graphical-session.target by default, but niri.service
  # activates that target internally — override to bind directly to niri.service
  # so DMS reliably starts when niri starts (same pattern as niri-flake-polkit).
  systemd.user.services.dms = {
    wantedBy = lib.mkForce [ "niri.service" ];
    partOf = lib.mkForce [ "niri.service" ];
    after = [ "niri.service" ];
  };

  # EPOMAKER Split65 has Y/Z swapped at firmware level.
  # Kanata intercepts it and swaps Y/Z back so that niri's global XKB
  # "macde" variant (which swaps Y/Z once) produces the same result
  # as on the laptop keyboard.
  services.kanata = {
    enable = true;
    keyboards.split65 = {
      devices = [ "/dev/input/by-id/usb-MILE_EPOMAKER_Split65-event-kbd" ];
      extraDefCfg = "process-unmapped-keys yes";
      config = ''
        (defsrc
          y z
        )

        (deflayer base
          z y
        )
      '';
    };
  };

  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.gnome.gcr-ssh-agent.enable = false;
  services.displayManager.plasma-login-manager.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.niri.default = [ "gtk" ];
  };

  security.polkit.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };
}
